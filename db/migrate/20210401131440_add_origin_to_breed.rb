class AddOriginToBreed < ActiveRecord::Migration[6.0]
  def change
    add_column :breeds, :origin, :string
  end
end
