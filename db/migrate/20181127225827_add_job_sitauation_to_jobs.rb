class AddJobSitauationToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :job_situation, foreign_key: true
  end
end
