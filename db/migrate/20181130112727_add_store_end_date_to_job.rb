class AddStoreEndDateToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :store_end_date, :date
  end
end
