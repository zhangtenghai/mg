class NewsController < ApplicationController
  
  def index
    @head_news = News.get_head_news
    @games = Game.get_current_year_not_sale_games.limit(7)
    #@news = News.get_date_news(params[:date])
    @news = News.page(params[:page]).per(20)
    #@dates = @news.select("created_at").group(:created_at).distinct
    @hot_game = Game.get_today_hot_game
    @voices = Voice.limit(3)
  end

  def show
    @hot_game = Game.get_today_hot_game
    @news = News.find_by_id(params[:id])
    @voices = Voice.limit(3)
  end

  def update
    @news = News.find_by_id(params[:id])
    @news.update(news_params)
    redirect_to @news 
  end

  private
    def news_params
      params.require(:news).permit(comments_attributes:[:content])
    end
end
