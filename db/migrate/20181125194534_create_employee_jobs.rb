class CreateEmployeeJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_jobs do |t|
      t.references :employee_detail, foreign_key: true
      t.references :job, foreign_key: true
      t.references :employeer_job_situation, foreign_key: true

      t.timestamps
    end
  end
end
