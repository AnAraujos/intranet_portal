class Job < ApplicationRecord
  belongs_to :meeting_point
  belongs_to :sub_store
  belongs_to :employee_detail, :foreign_key => 'supervisor_id'
  has_many :employee_details
  has_many :employee_jobs

 end
