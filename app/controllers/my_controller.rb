class MyController < ApplicationController
  before_filter :authenticate_user!
  def index
    #authorize! :use, :my
  end

  def scores
  end
end
