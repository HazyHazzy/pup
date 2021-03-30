class AddNewColumnsInVisitations < ActiveRecord::Migration[6.0]
  def change
    add_column :visitations, :name, :string
    add_column :visitations, :home_address, :string
    add_column :visitations, :email_address, :string
    add_column :visitations, :contact_number, :string
    add_column :visitations, :occupation, :string
    add_column :visitations, :reference, :string
    add_column :visitations, :screening_question, :text
  end
end
