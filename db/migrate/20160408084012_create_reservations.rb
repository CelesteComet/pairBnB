class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.text :specialrequests
      t.integer :user_id
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
