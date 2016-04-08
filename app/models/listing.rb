class Listing < ActiveRecord::Base
	belongs_to :user
	mount_uploaders :listingpics, ListingpicUploader
end
