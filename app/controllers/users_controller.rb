class UsersController < ApplicationController
  def index
    @users = User.where.not(username: "eewhyoh")
  end
end
