class Job < ApplicationRecord
  belongs_to :meeting_point
  belongs_to :sub_store
  belongs_to :employee_detail, :foreign_key => 'supervisor_id'
  has_many :employee_details
  has_many :employee_jobs, dependent: :destroy 

  def self.check_hours(employee_id, job_date)
    diff_days = (job_date - Date.today).round
    joins(:employee_jobs).
    where(:dt_start => (Date.today + diff_days).beginning_of_week..(Date.today + diff_days).end_of_week).
    where("employee_jobs.employee_detail_id =?", employee_id)
       
  end

  def self.check_jobs_dates_employee(employee_id, job)
    suppost_hours = job.supposed_hours + 12
    available_date_time_future = job.meeting_time + suppost_hours.hour
    available_date_time_past = job.meeting_time - 20.hour
    joins(:employee_jobs).
    where.not(:meeting_time => available_date_time_future..available_date_time_past).
    where("employee_jobs.employee_detail_id =?", employee_id)
  end

 end
