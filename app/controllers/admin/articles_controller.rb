class Admin::ArticlesController < ApplicationController
  load_and_authorize_resource :except => [:show]

  def index
    @articles = Article.enabled.search(params[:search]).page(params[:page])
  end

  def previews
    @articles = Article.enabled.previews.search(params[:search]).page(params[:page])
  end

  def evaluations
    @articles = Article.enabled.evaluations.search(params[:search]).page(params[:page])
  end

  def voices
    @articles = Article.enabled.voices.search(params[:search]).page(params[:page])
  end


  def show
  end

  def new
    @article = Article.new
    @article.category = params[:category] if params[:category]
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    path = case @article.category
     when '前瞻' then previews_admin_articles_path
     when '评测' then evaluations_admin_articles_path
     when '业界评论' then voices_admin_articles_path
     else admin_articles_url end
      
    if @article.save
      redirect_to path, :notice => "文章创建成功"
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
      params.require(:article).permit(:title,:topic,:head_img,:advantage_list,:disadvantage_list,:avatar, :summary, :user_id, :category, :content, :posted_at, :quote, :game_id)
    end
end
