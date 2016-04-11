class RemoveListingpicFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :listingpic, :string
  end
end
