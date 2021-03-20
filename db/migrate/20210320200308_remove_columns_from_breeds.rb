class RemoveColumnsFromBreeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :breeds, :weight
    remove_column :breeds, :life_span
  end
end
