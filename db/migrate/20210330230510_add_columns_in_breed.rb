class AddColumnsInBreed < ActiveRecord::Migration[6.0]
  def change
    add_column :breeds, :guardian_insticts, :integer
    add_column :breeds, :grooming_requirements, :integer
  end
end
