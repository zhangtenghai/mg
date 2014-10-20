class Admin::DescriptionsController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @descriptions = Description.all.page(params[:page])
  end

  def show
    @description = Description.find_by_id(params[:id])
  end

  
  def edit
  end


  def update
    if @description.update(description_params)
      redirect_to edit_admin_description_path(@description), notice: '编辑成功!'
    else
      render action: 'edit', notice: '编辑失败!'
    end
  end



  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def description_params
      params.require(:description).permit(:title,:content)
    end
end
