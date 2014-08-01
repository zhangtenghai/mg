class Admin::VoicesController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @voices = Voice.enabled.search(params[:search]).page(params[:page])
  end

  def show
    @voice = Voice.find_by_id(params[:id])
  end

  def new
    @voice = Voice.new
  end

  def edit
  end

  def create
    @voice = Voice.new(voice_params)
    if @voice.save
      redirect_to admin_voices_url, :notice => "新闻创建成功"
    else
      render action: 'new'
    end
  end

  def update
    if @voice.update(voice_params)
      redirect_to edit_admin_voice_path(@voice), notice: '新闻编辑成功!'
    else
      render action: 'edit', notice: '新闻编辑失败!'
    end
  end

  def destroy
    @voice.disable
    @voice.save
    redirect_to admin_voices_url, :notice => "删除成功！"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def voice_params
      params.require(:voice).permit(:user_name, :avatar,:user_title,:content)
    end
end
