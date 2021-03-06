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
      if (Rails.env.production?)
        @current_employee_job_by_month = Job.joins(:employee_jobs).
        where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
        group("mes, ano").
        order("ano, mes ASC").
        select("EXTRACT( month from dt_start::date)::integer as mes, EXTRACT( year from dt_start::date)::integer as ano, count(*) as count, sum(paid_hours) as paid_hours, sum(travel_hours) as travel_hours")
  		else
        @current_employee_job_by_month = Job.joins(:employee_jobs).
        group("strftime('%m-%Y', dt_start) ").
        where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
        select("jobs.*, employee_jobs.employee_detail_id as employee, count(*) as count, sum(paid_hours) as paid_hours, sum(travel_hours) as travel_hours")
      
      end
       @employee = EmployeeDetail.find_by(id: @current_user_employer_id)
       @employee_rate = @employee.employee_asset.rate
       @travel_rate = 9.90 
        
		end
  end

  def jobs_list
  	if user_signed_in?
      @employee = EmployeeDetail.find_by(id: @current_user_employer_id)
      @employee_rate = @employee.employee_asset.rate
      @travel_rate = 9.90 

      if (Rails.env.production?)
        m = params[:mes]
        y = params[:ano]
        @next_current_employee_job = Job.joins(:employee_jobs).
        where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
        where("EXTRACT( year from dt_start::date)::integer = ? ", y.to_i).
        where("EXTRACT( month from dt_start::date)::integer = ? ", m.to_i).
        where("employee_jobs.employeer_job_situation_id = 2").
        where("jobs.job_situation_id != 3 ").
        where("dt_start >= ?", DateTime.now)             
        


        @past_current_employee_job = Job.joins(:employee_jobs).
        where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
        where("EXTRACT( year from dt_start::date)::integer = ? ", y.to_i).
        where("EXTRACT( month from dt_start::date)::integer = ? ", m.to_i).
        where("dt_start < ?", DateTime.now).
        where("employee_jobs.employeer_job_situation_id = 2").
        where("jobs.job_situation_id != 3 ").
        select("jobs.*, employee_jobs.employeer_job_situation_id as situation")

      else
  		  dt =  Date.parse(params[:dt]).strftime('%m-%Y')
  		 	@next_current_employee_job = Job.joins(:employee_jobs).
  		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
  		 	where("strftime('%m-%Y', dt_start) = ? ", dt).
        where("employee_jobs.employeer_job_situation_id = 2").
        where("jobs.job_situation_id != 3 ").
        where("dt_start >= ?", DateTime.now)

  		 	@past_current_employee_job = Job.joins(:employee_jobs).
  		 	where("employee_jobs.employee_detail_id = ?", @current_user_employer_id).
        where("strftime('%m-%Y', dt_start) = ? ", dt).
        where("dt_start < ?", DateTime.now).
        where("employee_jobs.employeer_job_situation_id = 2").
        where("jobs.job_situation_id != 3 ").
  		 	select("jobs.*, employee_jobs.employeer_job_situation_id as situation")

     end 
		end
  end 
 
end