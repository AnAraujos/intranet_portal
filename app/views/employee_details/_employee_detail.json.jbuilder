json.extract! employee_detail, :id, :name, :surname, :phone_number, :address_1, :address_2, :employee_visa_id, :employee_asset_id, :employee_situation_id, :user_id, :dt_entry, :dt_leave, :created_at, :updated_at
json.url employee_detail_url(employee_detail, format: :json)
