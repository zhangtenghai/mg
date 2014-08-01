class GamesController < ApplicationController
  def index
    @topic = Article.get_topic_article("游戏")
  end

  def show
    @game = Game.find_by_id(params[:id])
  end
end
