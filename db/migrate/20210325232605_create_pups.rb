class CreatePups < ActiveRecord::Migration[6.0]
  def change
    create_table :pups do |t|
      t.string :name
      t.string :gender
      t.string :weight
      t.string :coat
      t.references :breed, null: false, foreign_key: true
      t.references :litter, null: false, foreign_key: true
    end
  end
end
