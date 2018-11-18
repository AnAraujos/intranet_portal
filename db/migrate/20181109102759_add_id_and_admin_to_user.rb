class AddIdAndAdminToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :employee_id, :string
  	add_column :users, :admin, :boolean, :default => false
  end
end
