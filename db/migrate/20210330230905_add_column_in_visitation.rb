class AddColumnInVisitation < ActiveRecord::Migration[6.0]
  def change
    add_column :visitations, :puppy_select, :string
  end
end
