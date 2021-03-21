class ChangeColumnsInBreeds < ActiveRecord::Migration[6.0]
  def change
    change_column :breeds, :trainability, 'integer USING CAST(trainability AS integer)'
    change_column :breeds, :family_friendly, 'integer USING CAST(family_friendly AS integer)'
    change_column :breeds, :activity_level, 'integer USING CAST(activity_level AS integer)'
  end
end
