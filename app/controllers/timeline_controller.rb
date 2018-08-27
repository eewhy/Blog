class TimelineController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @message = Message.new
  end

end
