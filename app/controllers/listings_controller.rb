class ListingsController < ApplicationController
before_action :set_listing, only: [:show, :edit, :update, :destroy]
before_action :require_login, only: [:edit, :update, :destroy, :create, :new]

  def create
    @user = current_user
    @listing = @user.listings.new(listing_params)

    # @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing_reservations = []
    
    @listing.reservations.each do |booking|
    @listing_reservations << booking
    end

  end

  def index
    return @listings = Listing.paginate(:page => params[:page], per_page: 1).where(user_id: params[:user_id]) if params[:user_id]
    @listings = Listing.paginate(:page => params[:page], per_page: 5).order(created_at: :desc)
  end

  def update
    # @user = current_user
    # byebug
    # Don't need user_id in params by doing @user.listing.update because you don't want to change the user_id
        respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
        @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      # params[:listing][:user_id] = current_user.id
      params.require(:listing).permit(:name, :home_type, :room_type, :accommodates, :address, :city, :user_id, :price_per_night, { :listingpics => [] })
    end
end
