class Admin::NewsController < ApplicationController
  include Switch
  load_and_authorize_resource :except => [:switch] 

  def index
    @news = News.unscoped.search(params[:search]).page(params[:page])
  end

  def show
    @news = News.unscoped.find_by_id(params[:id])
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to admin_news_index_path, :notice => "新闻创建成功"
    else
      render action: 'new'
    end
  end

  def update
    if @news.update(news_params)
      redirect_to edit_admin_news_path(@news), notice: '新闻编辑成功!'
    else
      render action: 'edit', notice: '新闻编辑失败!'
    end
  end

  def destroy
    @news.disable
    @news.save
    redirect_to admin_news_index_path, :notice => "删除成功！"
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title,:list_img,:summary, :user_id,:head_img,:is_head, :content, :posted_at, :game_id)
    end
end
