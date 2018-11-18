class UserMailer < ActionMailer::Base
	def send_mail_persons(user)
    @user = user
    mail :to => @user.email, :subject => "Welcome to Rgis.", :from => "rgis@gmail.com"
  end
end 