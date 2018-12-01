require "application_system_test_case"

class EmployeeJobsTest < ApplicationSystemTestCase
  setup do
    @employee_job = employee_jobs(:one)
  end

  test "visiting the index" do
    visit employee_jobs_url
    assert_selector "h1", text: "Employee Jobs"
  end

  test "creating a Employee job" do
    visit employee_jobs_url
    click_on "New Employee Job"

    fill_in "Employee Detail", with: @employee_job.employee_detail_id
    fill_in "Employeer Job Situation", with: @employee_job.employeer_job_situation_id
    fill_in "Job", with: @employee_job.job_id
    click_on "Create Employee job"

    assert_text "Employee job was successfully created"
    click_on "Back"
  end

  test "updating a Employee job" do
    visit employee_jobs_url
    click_on "Edit", match: :first

    fill_in "Employee Detail", with: @employee_job.employee_detail_id
    fill_in "Employeer Job Situation", with: @employee_job.employeer_job_situation_id
    fill_in "Job", with: @employee_job.job_id
    click_on "Update Employee job"

    assert_text "Employee job was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee job" do
    visit employee_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee job was successfully destroyed"
  end
end
