#encoding: utf-8
class PreviewsController < ApplicationController
  def index
    @articles = Article.enabled.previews
  end
end