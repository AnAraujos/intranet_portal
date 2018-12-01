require 'test_helper'

class EmployeeJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_job = employee_jobs(:one)
  end

  test "should get index" do
    get employee_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_job_url
    assert_response :success
  end

  test "should create employee_job" do
    assert_difference('EmployeeJob.count') do
      post employee_jobs_url, params: { employee_job: { employee_detail_id: @employee_job.employee_detail_id, employeer_job_situation_id: @employee_job.employeer_job_situation_id, job_id: @employee_job.job_id } }
    end

    assert_redirected_to employee_job_url(EmployeeJob.last)
  end

  test "should show employee_job" do
    get employee_job_url(@employee_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_job_url(@employee_job)
    assert_response :success
  end

  test "should update employee_job" do
    patch employee_job_url(@employee_job), params: { employee_job: { employee_detail_id: @employee_job.employee_detail_id, employeer_job_situation_id: @employee_job.employeer_job_situation_id, job_id: @employee_job.job_id } }
    assert_redirected_to employee_job_url(@employee_job)
  end

  test "should destroy employee_job" do
    assert_difference('EmployeeJob.count', -1) do
      delete employee_job_url(@employee_job)
    end

    assert_redirected_to employee_jobs_url
  end
end
