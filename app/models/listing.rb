class Listing < ActiveRecord::Base
	belongs_to :user
	mount_uploader :listingpic, ListingpicUploader
end
