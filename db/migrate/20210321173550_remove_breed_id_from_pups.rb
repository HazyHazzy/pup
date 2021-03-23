class RemoveBreedIdFromPups < ActiveRecord::Migration[6.0]
  def change
    remove_column :pups, :breed_id, :integer
  end
end
