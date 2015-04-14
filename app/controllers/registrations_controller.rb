class RegistrationsController < Devise::RegistrationsController
 
  def create
    build_resource(sign_up_params)
  
    resource_saved = resource.save
    yield resource if block_given?

    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        return render :json => {:success => true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        return render :json => {:success => true}
      end
    else
      p  resource.errors
      clean_up_passwords resource
      return render :json => {:success => false,:msg => resource.errors}
    end
  end
 
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end
 

  def sign_up_params
    params.require(:user).permit(:email, :password, :name)
  end
end