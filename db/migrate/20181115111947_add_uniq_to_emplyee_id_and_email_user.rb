class AddUniqToEmplyeeIdAndEmailUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :email, :string, :default => 'teste@gmail.com', :null => false
  	add_index :users, :employee_id, unique: true
  end
end
