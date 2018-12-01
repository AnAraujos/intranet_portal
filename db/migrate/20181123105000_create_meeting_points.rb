class CreateMeetingPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_points do |t|
      t.string :local

      t.timestamps
    end
  end
end
