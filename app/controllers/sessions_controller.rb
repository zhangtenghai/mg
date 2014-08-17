class SessionsController < Devise::SessionsController
  def create

    self.resource = warden.authenticate!(:scope=>:user ,:recall => "#{controller_path}##{request.xhr? ? 'failure' : 'new'}")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_to do |format|
        format.json { render :json => {:success => true}, :status => :ok }
        format.html { respond_with resource, :location => after_sign_in_path_for(resource) } 
    end
  end
 
  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end
end