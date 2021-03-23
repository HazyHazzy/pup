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
<<<<<<< HEAD:db/migrate/20210320192943_create_parents.rb

=======
>>>>>>> e2d7ead410fdcc6231fb09d1a1de38ed8937ce05:db/migrate/20210323225204_add_parents_table.rb
      t.timestamps
    end
  end
end
