class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :attendances
	has_many :events, through: :attendance

	 after_create :welcome_send
	 
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def participation_send
  	UserMailer.participation_email(self).deliver_now
  end
end
