class ChangeEmailAndEmployeeIdValidationInUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :email, :string, :default => "", :null => true
  	change_column :users, :employee_id, :string, :null => false
  end
end
