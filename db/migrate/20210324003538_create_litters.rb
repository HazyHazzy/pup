class CreateLitters < ActiveRecord::Migration[6.0]
  def change
    create_table :litters do |t|
      t.string :name
      t.date :birth_date
      t.references :breeder, null: false, foreign_key: true
      t.references :stud, index: true, foreign_key: {to_table: :parents}
      t.references :mom, index: true, foreign_key: {to_table: :parents}
      t.timestamps
    end
  end
end
