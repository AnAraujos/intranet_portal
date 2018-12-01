class CreateJobSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :job_situations do |t|
      t.string :desc

      t.timestamps
    end
  end
end
