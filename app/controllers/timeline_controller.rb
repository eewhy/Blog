class TimelineController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @message = Message.new
    following = current_user.following
    following << current_user.id
    @messages = Message.where(user_id: current_user.following)
  end

end
