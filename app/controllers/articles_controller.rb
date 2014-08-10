class ArticlesController < ApplicationController
  before_action :set_data, only: [:previews,:evaluations,:voices]
  def previews
    @articles = Article.enabled.previews.page(params[:page])
  end

  def evaluations
    @articles = Article.enabled.evaluations.page(params[:page])
  end

  def voices
    @articles = Article.enabled.voices.page(params[:page])
  end

  def show
     @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    @article.update(article_params)
    redirect_to @article 
  end

  private
    def article_params
      params.require(:article).permit(comments_attributes:[:content])
    end

    def set_data
      @hot_game = Game.get_today_hot_game
      @games = Game.enabled.order("sale_date desc").limit(7)
      @voices = Voice.limit(7)
    end
end
