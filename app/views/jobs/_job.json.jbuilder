json.extract! job, :id, :dt_start, :dt_end, :meeting_time, :start_time, :end_time, :job_end, :supervisor_id, :travel_hours, :paid_hours, :supposed_hours, :meeting_point_id, :sub_store_id, :created_at, :updated_at
json.url job_url(job, format: :json)
