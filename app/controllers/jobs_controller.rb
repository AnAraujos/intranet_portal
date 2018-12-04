class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.order(:dt_start).paginate(page: params[:page], per_page: 10) 
    
  end
  # GET /jobs/1
  # GET /jobs/1.json
  def show
    
  end

   def show_id
    job_id = params[:job_id]
    @employee_jobs = EmployeeJob.where(job_id: job_id)
    @job = Job.find(params[:job_id])
    render "show"
   end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create

    check_job_status = job_params[:job_situation_id].to_s

    if (check_job_status == "2")
      
      date_start = (job_params[:dt_start])
      time_start = (job_params[:start_time])
      meeting_time = (job_params[:meeting_time])

      date_end = (job_params[:dt_end])
      job_time_end = (job_params[:job_end])
      
      end_time = (job_params[:end_time])
      store_end_date = (job_params[:store_end_date])
      
      date_time_start = DateTime.parse([ date_start, time_start ].join(' '))
      date_time_end = DateTime.parse([ date_end, job_time_end ].join(' '))

      travel_store_end_date = DateTime.parse([ store_end_date, end_time ].join(' '))
      travel_job_end = DateTime.parse([ date_end, job_time_end ].join(' '))
      
      hours = ((date_time_end.to_time - date_time_start.to_time ) / 3_600 )
      travel_hours_start = ((time_start.to_time - meeting_time.to_time ) / 3_600 )
      travel_hours_end = (( travel_job_end.to_time - travel_store_end_date.to_time) / 3_600 )

      paid_hour = hours - ( travel_hours_start + travel_hours_end )
      travel_hours = travel_hours_start + travel_hours_end

      params[:job][:travel_hours] = travel_hours.round(2)
      params[:job][:paid_hours] = paid_hour.round(2)
   end

    meeting_date_time = DateTime.parse([ (job_params[:dt_start]), (job_params[:meeting_time]) ].join(' ')) 
    params[:job][:meeting_time] = meeting_date_time.strftime("%Y-%m-%d %H:%M:%S")
    
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        create_employee_job_supervisor(@job.id)
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show_id, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_employee_job_supervisor(job_id)
    job = job_id
    supervisor_id = params[:job][:supervisor_id]
    employee_job = EmployeeJob.new(job_id: job, employee_detail_id: supervisor_id, employeer_job_situation_id: 1)
    employee_job.save ? true : user.errors
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    check_job_status = job_params[:job_situation_id].to_s

    if (check_job_status == "2")

      date_start = (job_params[:dt_start])
      time_start = (job_params[:start_time])
      meeting_time = (job_params[:meeting_time])

      date_end = (job_params[:dt_end])
      job_time_end = (job_params[:job_end])
      
      end_time = (job_params[:end_time])
      store_end_date = (job_params[:store_end_date])
      
      date_time_start = DateTime.parse([ date_start, time_start ].join(' '))
      date_time_end = DateTime.parse([ date_end, job_time_end ].join(' '))

      travel_store_end_date = DateTime.parse([ store_end_date, end_time ].join(' '))
      travel_job_end = DateTime.parse([ date_end, job_time_end ].join(' '))
      
      hours = ((date_time_end.to_time - date_time_start.to_time ) / 3_600 )
      travel_hours_start = ((time_start.to_time - meeting_time.to_time ) / 3_600 )
      travel_hours_end = (( travel_job_end.to_time - travel_store_end_date.to_time) / 3_600 )

      paid_hour = hours - ( travel_hours_start + travel_hours_end )
      travel_hours = travel_hours_start + travel_hours_end

      params[:job][:travel_hours] = travel_hours.round(2)
      params[:job][:paid_hours] = paid_hour.round(2)

    end

    respond_to do |format|
      if @job.update(job_params)
        create_employee_job_supervisor(@job.id)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:sub_store_id, :dt_start, :meeting_time, :start_time, :meeting_point_id, :supervisor_id, :store_end_date, :end_time, :dt_end, :job_end, :travel_hours, :paid_hours, :supposed_hours, :job_situation_id)
    end
end
