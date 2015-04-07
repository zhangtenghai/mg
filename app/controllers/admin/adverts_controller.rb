class Admin::AdvertsController < ApplicationController
  include Switch
  load_and_authorize_resource :except => [:switch]

  def index
    @adverts = Advert.unscoped.page(params[:page])
  end

  def show
    @advert = Advert.unscoped.find_by_id(params[:id])
  end

  def new
    @ddvert = Advert.new
  end

  def edit
  end

  def create
    @advert = Advert.new(advert_params)
    if @advert.save
      redirect_to admin_adverts_path, :notice => "广告创建成功"
    else
      render action: 'new'
    end
  end

  def update
    if @advert.update(advert_params)
      redirect_to edit_admin_advert_path(@advert), notice: '广告编辑成功!'
    else
      render action: 'edit', notice: '广告编辑失败!'
    end
  end

  def destroy
   
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:name,:list_img, :link)
    end
end