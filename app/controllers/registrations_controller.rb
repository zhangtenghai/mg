class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
  
    resource_saved = resource.save
    yield resource if block_given?
    p params
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_to do |format|
          format.html { respond_with resource, location: after_sign_up_path_for(resource) }
          format.json { render :json => {:success => true} } 
        end
        #render :json => {:success => true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_to do |format|
          format.html { respond_with resource, location: after_inactive_sign_up_path_for(resource) }
          format.json { render :json => {:success => true} } 
        end
        #render :json => {:success => true}
      end
    else
      clean_up_passwords resource
      respond_to do |format|
        format.html { respond_with resource }
        format.json { render :json => {:success => false, :msg => resource.errors} } 
      end
      #render :json => {:success => false,:msg => resource.errors}
    end
  end
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
 

  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :password_confirmation)
  end
end