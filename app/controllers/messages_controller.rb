class MessagesController < ActionController::Base
  before_action :authenticate_user!

  def create
    current_user.messages.create!(message_params)
    redirect_to timeline_path
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
