class RemindersController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@reminder = current_user.reminders.build(reminder_params)
		if @reminder.save
			flash[:success] = "Reminder created!"
			redirect_to root_url
		else
			# @feed_items = [ ]
			render 'static_pages/home'
		end
	end

	def destroy
		@reminder.destroy
		redirect_to root_url
	end

	private

		def reminder_params
			params.require(:reminder).permit(:name, :event_date)
		end

		def correct_user
			@reminder = current_user.reminders.find_by(id: params[:id])
			redirect_to root_url if @reminder.nil?
		end
end