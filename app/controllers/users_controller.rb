class UsersController < ApplicationController
	before_action :require_login, except: [:index]

	def index
		@users = User.all
		@listings = Listing.paginate(:page => params[:page], per_page: 5).order(created_at: :desc)
	end
end
