class EmployeeJob < ApplicationRecord
  belongs_to :employee_detail, optional: true
  belongs_to :job, optional: true
  belongs_to :employeer_job_situation, optional: true

  
end
