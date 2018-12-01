require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { dt_end: @job.dt_end, dt_start: @job.dt_start, end_time: @job.end_time, job_end: @job.job_end, meeting_point_id: @job.meeting_point_id, meeting_time: @job.meeting_time, paid_hours: @job.paid_hours, start_time: @job.start_time, sub_store_id: @job.sub_store_id, supervisor_id: @job.supervisor_id, supposed_hours: @job.supposed_hours, travel_hours: @job.travel_hours } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { dt_end: @job.dt_end, dt_start: @job.dt_start, end_time: @job.end_time, job_end: @job.job_end, meeting_point_id: @job.meeting_point_id, meeting_time: @job.meeting_time, paid_hours: @job.paid_hours, start_time: @job.start_time, sub_store_id: @job.sub_store_id, supervisor_id: @job.supervisor_id, supposed_hours: @job.supposed_hours, travel_hours: @job.travel_hours } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
