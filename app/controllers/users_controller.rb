class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all - [current_user]
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.following << params[:id].to_i
    current_user.save
    redirect_to user_path(id: params[:id])
  end


end
