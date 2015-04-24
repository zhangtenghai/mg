class OmniauthCallbacksController < Devise::OmniauthCallbacksController
   #skip CSRF on create.
  skip_before_filter :verify_authenticity_token

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: 'success', :event => :authentication 
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :qq_connect, :all
  alias_method :weibo, :all
end