class Reminder < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('event_date') }
	validates :user_id, presence: true
	validates :name, presence: true

end
