class CreateBreedBreeders < ActiveRecord::Migration[6.0]
  def change
    create_table :breed_breeders do |t|
      t.references :breed, null: false, foreign_key: true
      t.references :breeder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
