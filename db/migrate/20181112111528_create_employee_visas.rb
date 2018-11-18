class CreateEmployeeVisas < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_visas do |t|
      t.string :desc

      t.timestamps
    end
  end
end
