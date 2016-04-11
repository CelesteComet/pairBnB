class AddListingpicToListings < ActiveRecord::Migration
  def change
    add_column :listings, :listingpic, :string
  end
end
