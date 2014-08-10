# encoding: utf-8
class My::ScoresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
  end

end