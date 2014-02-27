class DailyDigest < ActionMailer::Base
  default from: "mom@yourmom.me"

  def send_reminder_email(user)
  	@user = user
  	@reminders = @user.future_reminders
  	mail( 	:to => @user.email,
  			:subject => "Shit is about to get real for you")
  end
end
