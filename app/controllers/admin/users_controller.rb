class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.search(params[:search]).page(params[:page])
  end

  def create
    @user = User.new(user_params)
    
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.save
      redirect_to admin_users_url, :notice => "账户创建成功"
    else
       render action: 'new'
    end
  end
  
  def edit
  end

  def update
    u_params = user_params

    @user = User.find_by_id(params[:id])

    if u_params[:password].blank?
      u_params.delete("password")
      u_params.delete("password_confirmation")
    end

    if @user.update_attributes(u_params)
      if params[:locked] == "1"
        @user.lock_access!
      else
        @user.unlock_access!
      end

      redirect_to edit_admin_user_path(@user), :notice => "账户更新成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.lock_access!
    redirect_to admin_users_url
  end

    private

  def user_params
    params.require(:user).permit(:email, :password, :role, :name, :password_confirmation)
  end
end