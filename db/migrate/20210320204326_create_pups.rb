class CreatePups < ActiveRecord::Migration[6.0]
  def change
    create_table :pups do |t|
      t.integer :litter_id
      t.string :coat
      t.string :gender
      t.string :weight
      t.string :name
      t.integer :breed_id

      t.timestamps
    end
  end
end
