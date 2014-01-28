class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reminders, dependent: :destroy

  def future_reminders
	@future_reminders = reminders.select { |reminder| 
		if reminder.event_date 
			reminder.event_date >= Date.today
		end
	}
  end

  def past_reminders
	@past_reminders = reminders.select { |reminder| 
		if reminder.event_date
			reminder.event_date < Date.today
		end
	}
  end

end
