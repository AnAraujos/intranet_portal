class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_assets do |t|
      t.string :description

      t.timestamps
    end
  end
end
