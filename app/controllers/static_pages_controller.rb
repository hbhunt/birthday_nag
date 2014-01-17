class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@reminder = current_user.reminders.build
  		@reminders = current_user.reminders.paginate(page: params[:page])
  		@future_reminders = current_user.future_reminders
  		@past_reminders = current_user.future_reminders
  	end
  end
end