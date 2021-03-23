class AddParentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.integer :weight
      t.string :coat
      t.string :description
      t.string :gender
      t.references :breed, null: false, foreign_key: true
      t.references :breeder, null: false, foreign_key: true
      t.timestamps
    end
  end
end
