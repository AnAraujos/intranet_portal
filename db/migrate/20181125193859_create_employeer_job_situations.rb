class CreateEmployeerJobSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :employeer_job_situations do |t|
      t.string :status

      t.timestamps
    end
  end
end
