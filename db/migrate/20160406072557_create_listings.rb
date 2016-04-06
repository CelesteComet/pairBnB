class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodates
      t.text :address
      t.string :city
      t.integer :user_id
      t.timestamps
    end
  end
end
