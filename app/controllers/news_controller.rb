class NewsController < ApplicationController
 
  def show
    @news = News.find_by_id(params[:id])
  end

end
