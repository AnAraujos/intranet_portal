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
       group("mes, ano").
		 	 select("EXTRACT( month from dt_start::date)::integer as mes, EXTRACT( year from dt_start::date)::integer as ano, count(*) as count, sum(paid_hours) as paid_hours, sum(travel_hours) as travel_hours")
		 	 
      @employee = EmployeeDetail.find_by(id: @current_user_employer_id)

      @employee_rate = @employee.employee_asset.rate

      @travel_rate = 9.90



		end
  end

  def jobs_list
  	if user_signed_in?
     
      puts params[:ano]
      m = params[:mes]
      y = params[:ano]
		 	@next_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
		 	where("EXTRACT( year from dt_start::date)::integer = ? ", y.to_i).
      where("EXTRACT( month from dt_start::date)::integer = ? ", m.to_i)


		 	@past_current_employee_job = Job.joins(:employee_jobs).
		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
      where("EXTRACT( year from dt_start::date)::integer = ? ", y.to_i).
      where("EXTRACT( month from dt_start::date)::integer = ? ", m.to_i).
		 	select("jobs.*, employee_jobs.employeer_job_situation_id as situation")
    
		 	
		end
  end 
 
end