class Reminders < ActiveRecord::Migration
  def change
  	create_table(:reminders) do |t|
  		t.string	:name
  		t.date		:event_date	
  		t.integer 	:user_id
  		t.boolean	:is_active

  		t.timestamps
  	end
  	add_index :reminders, [:user_id, :event_date, :is_active]
  end
end
