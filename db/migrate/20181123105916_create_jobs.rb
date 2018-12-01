class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.date :dt_start
      t.date :dt_end
      t.time :meeting_time
      t.time :start_time
      t.time :end_time
      t.time :job_end
      t.integer :supervisor_id
      t.decimal :travel_hours
      t.decimal :paid_hours
      t.integer :supposed_hours
      t.references :meeting_point, foreign_key: true
      t.references :sub_store, foreign_key: true

      t.timestamps
    end
  end
end
