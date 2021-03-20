class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :description
      t.string :life_span
      t.string :health_issue
      t.string :activity_level
      t.string :coats
      t.string :family_friendly
      t.string :trainability
      t.string :weight

      t.timestamps
    end
  end
end
