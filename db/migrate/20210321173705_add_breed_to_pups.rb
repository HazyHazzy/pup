class AddBreedToPups < ActiveRecord::Migration[6.0]
  def change
    add_reference :pups, :breed, null: false, foreign_key: true
  end
end
