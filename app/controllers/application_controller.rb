#encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_filter :set_current_user
  after_filter :store_location
  layout :layout_by_resource

  before_filter do
    resource = controller_name.singularize.to_sym
    action = action_name.singularize.to_sym
    method_each_action = "#{action}_#{resource}_params"
    method_all_in_one = "#{resource}_params"
    params[resource] &&= (send(method_each_action) if respond_to?(method_each_action, true)) || (send(method_all_in_one) if respond_to?(method_all_in_one, true))
  end

  

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
    if resource.role!="普通用户"
      admin_home_index_path
    else
      session[:previous_url] || root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  def set_current_user
    User.current_user = current_user
  end

  protected

  def layout_by_resource
    if devise_controller?
        'devise'
    else
      if controller_path.split('/').first == "admin"
        case action_name 
        when 'index' then 'list'
        when 'show', 'new', 'edit', 'update', 'create' then 'form'
        else 'application' end if controller_name != 'home'
      else
        "front"
      end
    end
  end

end
