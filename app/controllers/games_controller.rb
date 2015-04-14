class GamesController < ApplicationController
  include GenerateWeek

  def index
    @topic = Article.get_topic_article("游戏")
    @games = Game.get_month_hot_games
    @game_sales = Game.get_current_year_not_sale_games.limit(7)
    @week = generate_week(Date.today,params[:page])
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def expect
    @topic = Article.get_topic_article("游戏")
    @games = Game.get_month_expect_games
    @game_sales = Game.get_current_year_not_sale_games.limit(7)
    @week = generate_week(Date.today,params[:page])
  end

  def search
    @game_results = Game.search(params[:game_search])
    if !params[:min_score].blank?
      @game_results = @game_results.where("avg_score>=#{params[:min_score].to_i}")
    end
    if !params[:platform].blank?
      @game_results = @game_results.tagged_with(params[:platform], :on => :platform, :any => true)
    end
    if !params[:start_at].blank?
      @game_results = @game_results.where("sale_date >= ? ",params[:start_at])
    end
    if !params[:end_at].blank?
      @game_results = @game_results.where("sale_date <= ? ",params[:end_at])
    end

    @game_results = @game_results.page(params[:page]).per(20)
    @game_sales = Game.get_current_year_not_sale_games.limit(7)
  end

  def update
    @game = Game.find_by_id(params[:id])
    if params[:star]
      @game.set_user_score(params[:star])
    end
    @game.update(game_params)
    
    redirect_to @game 
  end

  private
    def game_params
      params.require(:game).permit(comments_attributes:[:content])
    end
end
