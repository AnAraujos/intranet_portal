class ChangeMeetingTimeToBeDateTime < ActiveRecord::Migration[5.2]
  def change
  	change_column :jobs, :meeting_time, :datetime
  end
end
