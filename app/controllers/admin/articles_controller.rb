class Admin::ArticlesController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @articles = Article.enabled.search(params[:search]).page(params[:page])
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_articles_url, :notice => "文章创建成功"
    else
      render action: 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to edit_admin_article_path(@article), notice: '文章编辑成功!'
    else
      render action: 'edit', notice: '文章编辑失败!'
    end
  end

  def destroy
    @article.disable
    @article.save
    redirect_to admin_articles_url, :notice => "删除成功！"
  end

  private
    def article_params
      params.require(:article).permit(:title,:topic,:head_img,:avatar, :summary, :user_id, :category, :content, :posted_at, :quote, :game_id)
    end
end
