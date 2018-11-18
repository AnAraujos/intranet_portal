require 'test_helper'

class EmployeeDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_detail = employee_details(:one)
  end

  test "should get index" do
    get employee_details_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_detail_url
    assert_response :success
  end

  test "should create employee_detail" do
    assert_difference('EmployeeDetail.count') do
      post employee_details_url, params: { employee_detail: { address_1: @employee_detail.address_1, address_2: @employee_detail.address_2, dt_entry: @employee_detail.dt_entry, dt_leave: @employee_detail.dt_leave, employee_asset_id: @employee_detail.employee_asset_id, employee_situation_id: @employee_detail.employee_situation_id, employee_visa_id: @employee_detail.employee_visa_id, name: @employee_detail.name, phone_number: @employee_detail.phone_number, surname: @employee_detail.surname, user_id: @employee_detail.user_id } }
    end

    assert_redirected_to employee_detail_url(EmployeeDetail.last)
  end

  test "should show employee_detail" do
    get employee_detail_url(@employee_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_detail_url(@employee_detail)
    assert_response :success
  end

  test "should update employee_detail" do
    patch employee_detail_url(@employee_detail), params: { employee_detail: { address_1: @employee_detail.address_1, address_2: @employee_detail.address_2, dt_entry: @employee_detail.dt_entry, dt_leave: @employee_detail.dt_leave, employee_asset_id: @employee_detail.employee_asset_id, employee_situation_id: @employee_detail.employee_situation_id, employee_visa_id: @employee_detail.employee_visa_id, name: @employee_detail.name, phone_number: @employee_detail.phone_number, surname: @employee_detail.surname, user_id: @employee_detail.user_id } }
    assert_redirected_to employee_detail_url(@employee_detail)
  end

  test "should destroy employee_detail" do
    assert_difference('EmployeeDetail.count', -1) do
      delete employee_detail_url(@employee_detail)
    end

    assert_redirected_to employee_details_url
  end
end
