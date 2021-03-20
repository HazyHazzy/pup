class AddNewsColumnsInBreeds < ActiveRecord::Migration[6.0]
  def change
    add_column :breeds, :minimum_weight, :integer
    add_column :breeds, :maximum_weight, :integer
    add_column :breeds, :minimum_life_span, :integer
    add_column :breeds, :maximum_life_span, :integer
  end
end
