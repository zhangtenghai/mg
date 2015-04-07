module Switch
  extend ActiveSupport::Concern
  # included do
  #   load_and_authorize_resource :except => [:switch]
  # end
  def switch
    object = controller_name.classify.constantize.unscoped.find(params[:id])
    object.disabled = !object.disabled
    object.save
    redirect_to request.referer, :notice => "#{object.disabled ? '删除' : '恢复'}成功！"
  end

end