class CreateEmployeeDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_details do |t|
      t.string :name
      t.string :surname
      t.integer :phone_number
      t.string :address_1
      t.string :address_2
      t.references :employee_visa, foreign_key: true
      t.references :employee_asset, foreign_key: true
      t.references :employee_situation, foreign_key: true
      t.references :user, foreign_key: true
      t.date :dt_entry
      t.date :dt_leave

      t.timestamps
    end
  end
end
