#encoding: utf-8
class HomeController < ApplicationController
  def index
    @topic = Article.get_topic_article("首页")
    @head_news = News.get_head_news
    @news = News.where(is_head:false).limit(4)
    @articles = Article.page(params[:page]).per(20)
    @hot_game = Game.get_today_hot_game
    @games = Game.get_current_year_not_sale_games.limit(7)
    @voices = Voice.limit(7)
  end
end