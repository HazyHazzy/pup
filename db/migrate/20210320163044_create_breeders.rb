class CreateBreeders < ActiveRecord::Migration[6.0]
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :city
      t.string :about_us
      t.string :website_url
      t.string :email
      t.string :phone_number
      t.string :user_id
      t.string :references

      t.timestamps
    end
  end
end
