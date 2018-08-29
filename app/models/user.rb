class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    "#{first_name} #{last_name}"
  end

  has_many :messages
  has_one_attached :avatar

#want to take this field and saves it as array
  serialize :following, Array

end
