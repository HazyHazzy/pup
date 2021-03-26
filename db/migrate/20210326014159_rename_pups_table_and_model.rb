class RenamePupsTableAndModel < ActiveRecord::Migration[6.0]
  def change
    rename_table :pups, :puppies
  end
end
