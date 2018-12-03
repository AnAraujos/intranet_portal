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
       where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	 select("EXTRACT( month from dt_start::date) as mes, EXTRACT( year from dt_start::date) as ano, max(dt_start) as dtstart, count(*) as count, sum(paid_hours) as paid_hours, sum(travel_hours) as travel_hours group by mes , ano")
		 	 
      @employee = EmployeeDetail.find_by(id: @current_user_employer_id)

      @employee_rate = @employee.employee_asset.rate

      @travel_rate = 9.90



		end
  end

  def jobs_list
  	if user_signed_in?
      dt = Date.parse(params[:dt])
      puts dt
      puts params[:ano]
      m = params[:mes]
      y = params[:ano]
		 	@next_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("EXTRACT( year from dt_start::date) = ? ", y)


		 	@past_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
      where("EXTRACT( year from dt_start::date) = ? ", y).
		 	select("jobs.*, employee_jobs.employeer_job_situation_id as situation")
    
		 	
		end
  end 
 
end