class CreateEmployeeSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_situations do |t|
      t.string :status

      t.timestamps
    end
  end
end
