# encoding: utf-8
class Ajax::UserFavoritesController < ApplicationController
  before_filter :authenticate_user!

  def news
    current_user.set_favorite_news(News.find_by_id(params[:id]))
  end

  def game
    current_user.set_favorite_game(Game.find_by_id(params[:id]))
  end

  def article
    current_user.set_favorite_article(Article.find_by_id(params[:id]))
  end
end