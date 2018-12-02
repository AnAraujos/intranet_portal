class UserMailer < ActionMailer::Base
	def send_mail_persons(user)
    @user = user
    mail :to => @user.email, :subject => "Welcome to HR System.", :from => "hr@gmail.com"
  end
end 