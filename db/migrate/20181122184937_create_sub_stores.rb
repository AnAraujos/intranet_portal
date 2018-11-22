class CreateSubStores < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_stores do |t|
      t.string :number
      t.references :store, foreign_key: true
      t.decimal :unit_qtd
      t.string :contact_manager
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
