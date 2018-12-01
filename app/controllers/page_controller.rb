class PageController < ApplicationController
  def home
  	if user_signed_in?
		 	@current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("employee_jobs.employeer_job_situation_id = '1'")
		end
  end

  def myjobs
  	if user_signed_in?
		 	 @current_employee_job_by_month = Job.joins(:employee_jobs).
		 	 group("strftime('%Y', dt_start)").
		 	 group("strftime('%m', dt_start)").select("jobs.*, employee_jobs.employee_detail_id as employee")
		 	 #where("NOT EXISTS(SELECT 1 from employee_jobs where employee_details.id = employee_jobs.employee_detail_id and employee_jobs.job_id = #{job_id})").    
      #(select("strftime('%m', dt_start) as dt_start"))
		 	# SELECT 1 from employee_jobs where employee_details.id = employee_jobs.employee_detail_id and employee_jobs.job_id = #{job_id})"
		 	 #where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	 # where("employee_jobs.employeer_job_situation_id = '1'").
			 #.group("strftime('%m', dt_start)").count("strftime('%m', dt_start)")
		end
  end

  def jobs_list
  	if user_signed_in?
		 	@next_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("job_situation_id != '1'").
		 	where("employee_jobs.employeer_job_situation_id != '1'")

		 	@past_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("jobs.job_situation_id = '2'").
		 	where("employee_jobs.employeer_job_situation_id != '1'").
		 	select("jobs.*, employee_jobs.employeer_job_situation_id as situation")
		end
  end 
 
end