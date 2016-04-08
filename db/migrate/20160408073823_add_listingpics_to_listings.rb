class AddListingpicsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :listingpics, :json
  end
end
