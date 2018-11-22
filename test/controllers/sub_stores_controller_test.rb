require 'test_helper'

class SubStoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_store = sub_stores(:one)
  end

  test "should get index" do
    get sub_stores_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_store_url
    assert_response :success
  end

  test "should create sub_store" do
    assert_difference('SubStore.count') do
      post sub_stores_url, params: { sub_store: { address: @sub_store.address, contact_manager: @sub_store.contact_manager, number: @sub_store.number, phone: @sub_store.phone, store_id: @sub_store.store_id, unit_qtd: @sub_store.unit_qtd } }
    end

    assert_redirected_to sub_store_url(SubStore.last)
  end

  test "should show sub_store" do
    get sub_store_url(@sub_store)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_store_url(@sub_store)
    assert_response :success
  end

  test "should update sub_store" do
    patch sub_store_url(@sub_store), params: { sub_store: { address: @sub_store.address, contact_manager: @sub_store.contact_manager, number: @sub_store.number, phone: @sub_store.phone, store_id: @sub_store.store_id, unit_qtd: @sub_store.unit_qtd } }
    assert_redirected_to sub_store_url(@sub_store)
  end

  test "should destroy sub_store" do
    assert_difference('SubStore.count', -1) do
      delete sub_store_url(@sub_store)
    end

    assert_redirected_to sub_stores_url
  end
end
