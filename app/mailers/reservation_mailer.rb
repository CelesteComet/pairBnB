class ReservationMailer < ApplicationMailer
	default from: "johnsonbbnb@gmail.com"

	def reservation_email(user, listing, reserver)
		@user = user
		@listing = listing
		@reserver = reserver
		# byebug
    mail(to: @user.email, subject: 'Hi ' + @user.profile.name.to_s + '! You have a new reservation for your '+ @listing.name + ' listing on JohnsonBBnb! ')
    end

    def confirmation_email(user, listing, reserver)
		@user = user
		@listing = listing
		@reserver = reserver
		# byebug
    mail(to: @reserver.email, subject: 'Hi ' + @reserver.profile.name.to_s + '! Your reservation for '+ @listing.name + ' on JohnsonBBnb is confirmed! ')
    end


end
