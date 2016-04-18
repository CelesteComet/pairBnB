class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, :dependent => :destroy
	validates_presence_of :price_per_night, :home_type, :room_type, :accommodates, :address, :city, :name, :listingpics
	mount_uploaders :listingpics, ListingpicUploader
	searchkick
end
