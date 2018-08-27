class Message < ApplicationRecord
  belongs_to :user
#messages are placed in descending order of date
  default_scope {order(created_at: :desc)}
end
