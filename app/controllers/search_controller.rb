#encoding: utf-8
class SearchController < ApplicationController
  def index
    @topic = Article.get_topic_article("搜索")
    @games = params[:search_text].blank? ? Game.none : Game.enabled.search(params[:search_text])
    @news =  params[:search_text].blank? ? News.none : News.enabled.search(params[:search_text])
    @articles = params[:search_text].blank? ? Article.none : Article.enabled.search(params[:search_text])
  end
end