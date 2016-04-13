class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	has_many :transactions

	def total_price
		total_price = 0
		days = (self.checkout - self.checkin).to_i 
		total_price = days*(self.listing.price_per_night)
		return total_price
	end
end
