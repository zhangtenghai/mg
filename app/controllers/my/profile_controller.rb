# encoding: utf-8
class My::ProfileController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    redirect_to my_profile_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :pet_name, :weibo,:qq,:signature, :avatar)
  end
end