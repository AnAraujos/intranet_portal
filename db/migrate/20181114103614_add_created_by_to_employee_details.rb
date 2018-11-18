class AddCreatedByToEmployeeDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_details, :created_by, :integer
  end
end
