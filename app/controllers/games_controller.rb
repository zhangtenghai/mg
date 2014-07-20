class GamesController < ApplicationController
  load_and_authorize_resource :except => [:show]
 
  def index
    @games = Game.enabled.search(params[:search]).page(params[:page])
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_url, :notice => "游戏创建成功"
    else
      render action: 'new'
    end
  end

  def update
    if @game.update(game_params)
      redirect_to edit_game_path(@game), notice: '游戏信息编辑成功!'
    else
      render action: 'edit', notice: '游戏信息编辑失败!'
    end
  end

  def destroy
    @game.disable
    @game.save
    redirect_to games_url, :notice => "删除成功！"
  end

  private
    def game_params
      params.require(:game).permit(:name, :origin_name, :developer, :website, :publisher, :sale_price, :rating, :avg_score, :sale_date)
    end
end
