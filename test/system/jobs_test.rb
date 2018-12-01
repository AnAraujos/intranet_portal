require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Dt End", with: @job.dt_end
    fill_in "Dt Start", with: @job.dt_start
    fill_in "End Time", with: @job.end_time
    fill_in "Job End", with: @job.job_end
    fill_in "Meeting Point", with: @job.meeting_point_id
    fill_in "Meeting Time", with: @job.meeting_time
    fill_in "Paid Hours", with: @job.paid_hours
    fill_in "Start Time", with: @job.start_time
    fill_in "Sub Store", with: @job.sub_store_id
    fill_in "Supervisor", with: @job.supervisor_id
    fill_in "Supposed Hours", with: @job.supposed_hours
    fill_in "Travel Hours", with: @job.travel_hours
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Dt End", with: @job.dt_end
    fill_in "Dt Start", with: @job.dt_start
    fill_in "End Time", with: @job.end_time
    fill_in "Job End", with: @job.job_end
    fill_in "Meeting Point", with: @job.meeting_point_id
    fill_in "Meeting Time", with: @job.meeting_time
    fill_in "Paid Hours", with: @job.paid_hours
    fill_in "Start Time", with: @job.start_time
    fill_in "Sub Store", with: @job.sub_store_id
    fill_in "Supervisor", with: @job.supervisor_id
    fill_in "Supposed Hours", with: @job.supposed_hours
    fill_in "Travel Hours", with: @job.travel_hours
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
