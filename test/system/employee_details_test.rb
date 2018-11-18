require "application_system_test_case"

class EmployeeDetailsTest < ApplicationSystemTestCase
  setup do
    @employee_detail = employee_details(:one)
  end

  test "visiting the index" do
    visit employee_details_url
    assert_selector "h1", text: "Employee Details"
  end

  test "creating a Employee detail" do
    visit employee_details_url
    click_on "New Employee Detail"

    fill_in "Address 1", with: @employee_detail.address_1
    fill_in "Address 2", with: @employee_detail.address_2
    fill_in "Dt Entry", with: @employee_detail.dt_entry
    fill_in "Dt Leave", with: @employee_detail.dt_leave
    fill_in "Employee Asset", with: @employee_detail.employee_asset_id
    fill_in "Employee Situation", with: @employee_detail.employee_situation_id
    fill_in "Employee Visa", with: @employee_detail.employee_visa_id
    fill_in "Name", with: @employee_detail.name
    fill_in "Phone Number", with: @employee_detail.phone_number
    fill_in "Surname", with: @employee_detail.surname
    fill_in "User", with: @employee_detail.user_id
    click_on "Create Employee detail"

    assert_text "Employee detail was successfully created"
    click_on "Back"
  end

  test "updating a Employee detail" do
    visit employee_details_url
    click_on "Edit", match: :first

    fill_in "Address 1", with: @employee_detail.address_1
    fill_in "Address 2", with: @employee_detail.address_2
    fill_in "Dt Entry", with: @employee_detail.dt_entry
    fill_in "Dt Leave", with: @employee_detail.dt_leave
    fill_in "Employee Asset", with: @employee_detail.employee_asset_id
    fill_in "Employee Situation", with: @employee_detail.employee_situation_id
    fill_in "Employee Visa", with: @employee_detail.employee_visa_id
    fill_in "Name", with: @employee_detail.name
    fill_in "Phone Number", with: @employee_detail.phone_number
    fill_in "Surname", with: @employee_detail.surname
    fill_in "User", with: @employee_detail.user_id
    click_on "Update Employee detail"

    assert_text "Employee detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee detail" do
    visit employee_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee detail was successfully destroyed"
  end
end
