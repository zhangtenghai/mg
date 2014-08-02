class GamesController < ApplicationController
  include GenerateWeek

  def index
    @topic = Article.get_topic_article("游戏")
    @games = Game.get_month_hot_games
    @week = generate_week(Date.today,params[:page])
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def expect
    @topic = Article.get_topic_article("游戏")
    @games = Game.get_month_expect_games
    @week = generate_week(Date.today,params[:page])
  end

end
