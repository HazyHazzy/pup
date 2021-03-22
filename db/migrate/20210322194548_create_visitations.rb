class CreateVisitations < ActiveRecord::Migration[6.0]
  def change
    create_table :visitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :breeder, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
