class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@reminder = current_user.reminders.build
  		@reminders = current_user.reminders.paginate(page: params[:page])
  	end
  end
end