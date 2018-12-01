class SubStore < ApplicationRecord
  belongs_to :store, :foreign_key => "store_id"

  def label_for_substore
    "#{store.name} - #{number}"
  end

end
