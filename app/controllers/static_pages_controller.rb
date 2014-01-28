class StaticPagesController < ApplicationController
  require 'will_paginate/array'

  def home
  	if signed_in?
  		@reminder = current_user.reminders.build
  		@reminders = current_user.reminders.paginate(page: params[:page])
  		@future_reminders = current_user.future_reminders.paginate(page: params[:page])
  		@past_reminders = current_user.past_reminders.paginate(page: params[:page])
  	end
  end
end