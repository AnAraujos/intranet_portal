class User < ApplicationRecord
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:employee_id]

	validates :email, uniqueness: true
	validates :employee_id, uniqueness: true

	def self.send_email_to_users(user)
    UserMailer.send_mail_persons(user).deliver 
  end
end
