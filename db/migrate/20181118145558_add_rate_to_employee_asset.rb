class AddRateToEmployeeAsset < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_assets, :rate, :decimal
  end
end
