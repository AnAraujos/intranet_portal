require "application_system_test_case"

class SubStoresTest < ApplicationSystemTestCase
  setup do
    @sub_store = sub_stores(:one)
  end

  test "visiting the index" do
    visit sub_stores_url
    assert_selector "h1", text: "Sub Stores"
  end

  test "creating a Sub store" do
    visit sub_stores_url
    click_on "New Sub Store"

    fill_in "Address", with: @sub_store.address
    fill_in "Contact Manager", with: @sub_store.contact_manager
    fill_in "Number", with: @sub_store.number
    fill_in "Phone", with: @sub_store.phone
    fill_in "Store", with: @sub_store.store_id
    fill_in "Unit Qtd", with: @sub_store.unit_qtd
    click_on "Create Sub store"

    assert_text "Sub store was successfully created"
    click_on "Back"
  end

  test "updating a Sub store" do
    visit sub_stores_url
    click_on "Edit", match: :first

    fill_in "Address", with: @sub_store.address
    fill_in "Contact Manager", with: @sub_store.contact_manager
    fill_in "Number", with: @sub_store.number
    fill_in "Phone", with: @sub_store.phone
    fill_in "Store", with: @sub_store.store_id
    fill_in "Unit Qtd", with: @sub_store.unit_qtd
    click_on "Update Sub store"

    assert_text "Sub store was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub store" do
    visit sub_stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub store was successfully destroyed"
  end
end
