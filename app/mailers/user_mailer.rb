class UserMailer < ActionMailer::Base
	def send_mail_persons(user)
    @user = user
    mail :to => @user.email, :subject => "Welcome to the INTRANET System.", :from => "intranet@gmail.com"
  end
end 