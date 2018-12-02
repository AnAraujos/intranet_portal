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
       group("EXTRACT( month from dt_start::date)").
       group("EXTRACT( year from dt_start::date)::integer").
		 	 where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	 select("count(*) as count, sum(paid_hours) as paid_hours, sum(travel_hours) as travel_hours")
		 	 
      @employee = EmployeeDetail.find_by(id: @current_user_employer_id)

      @employee_rate = @employee.employee_asset.rate

      @travel_rate = 9.90



		end
  end

  def jobs_list
  	if user_signed_in?
		 	@next_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("job_situation_id = '1'").
		 	where("employee_jobs.employeer_job_situation_id != '1'").
		 	where("strftime('%m-%Y', dt_start) = ? ", params[:dt])

		 	@past_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("jobs.job_situation_id = '2'").
		 	where("employee_jobs.employeer_job_situation_id != '1'").
		 	select("jobs.*, employee_jobs.employeer_job_situation_id as situation").
		 	where("strftime('%m-%Y', dt_start) = ? ", params[:dt])
		end
  end 
 
end