class CreateLitters < ActiveRecord::Migration[6.0]
  def change
    create_table :litters do |t|
      t.string :name
      t.date :birth_date
      t.references :breeder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
