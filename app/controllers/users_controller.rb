class UsersController < ApplicationController
  def show
    @user = User.find_by_pet_name(params[:id])
  end

end
