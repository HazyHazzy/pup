class RemoveLitterIdFromPups < ActiveRecord::Migration[6.0]
  def change
    remove_column :pups, :litter_id, :integer
  end
end
