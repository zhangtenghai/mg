#encoding: utf-8
class Admin::HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    authorize! :index, :home
  end
end