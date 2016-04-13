class AddPricepernightToListings < ActiveRecord::Migration
  def change
    add_column :listings, :price_per_night, :integer
  end
end
