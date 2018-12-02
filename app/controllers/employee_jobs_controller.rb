class EmployeeJobsController < ApplicationController
  before_action :set_employee_job, only: [:show, :edit, :update, :destroy]

  # GET /employee_jobs
  # GET /employee_jobs.json
  def index
    @employee_jobs = EmployeeJob.all
  end

  # GET /employee_jobs/1
  # GET /employee_jobs/1.json
  def show
  end

  # GET /employee_jobs/new
  def new
    @job_id = params[:job_id]
    @employee_job = EmployeeJob.new(job_id: params[:job_id])


  end

  # GET /employee_jobs/1/edit
  def edit
  end

  def edit_situation
     @get_employee_job = EmployeeJob.where("job_id = ?", params[:job_id]).
     where("employee_detail_id = ?", @current_user_employer_id.id)
     @get_employee_job.update_all(employeer_job_situation_id: params[:id_status])
  end

  # POST /employee_jobs
  # POST /employee_jobs.json
  def create 

    params[:listed].each do |list_id|
      employee_id = list_id
      params[:employee_job][:employee_detail_id] = employee_id
      @employee_job = EmployeeJob.new(employee_job_params)
      @employee_job.save
    end
      respond_to do |format|
          if @employee_job.save
            format.html { redirect_to job_path(@job, id: params[:employee_job][:job_id]), notice: 'Employee job was successfully created.' }
            format.json { render :show, status: :created, location: @job }
          else
            format.html { render :new }
            format.json { render json: @employee_job.errors, status: :unprocessable_entity }
          end
        end
  end

  # PATCH/PUT /employee_jobs/1
  # PATCH/PUT /employee_jobs/1.json
  def update
    respond_to do |format|
      if @employee_job.update(employee_job_params)
        format.html { redirect_to @employee_job, notice: 'Employee job was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_job }
      else
        format.html { render :edit }
        format.json { render json: @employee_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_jobs/1
  # DELETE /employee_jobs/1.json
  def destroy
    @employee_job.destroy
    respond_to do |format|
      format.html { redirect_to employee_jobs_url, notice: 'Employee job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_limite_hours
    employee_id = params[:employee]
    job_id = params[:job_id]
    @job_ckeck_date = Job.find(params[:job_id])
    check_visa = EmployeeDetail.check_visa(employee_id)
    if !check_visa.empty?
      @check_hours = Job.check_hours(employee_id, @job_ckeck_date.dt_start)
      @total_hours = @check_hours.sum(:supposed_hours)
      json_return = @total_hours
      if (@total_hours <= 20)
         @check_jobs_dates_employee = Job.check_jobs_dates_employee(employee_id, @job_ckeck_date) 
         json_return = @check_jobs_dates_employee
      end 
    else  
      @check_jobs_dates_employee = Job.check_jobs_dates_employee(employee_id, @job_ckeck_date)
      json_return = @check_jobs_dates_employee 
    end
    respond_to do |format|
        format.json { 
            render json: json_return.as_json
        } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_job
      @employee_job = EmployeeJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_job_params
      params.require(:employee_job).permit(:employee_detail_id, :job_id, :employeer_job_situation_id)
    end
end
