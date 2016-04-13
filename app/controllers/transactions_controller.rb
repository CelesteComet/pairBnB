class TransactionsController < ApplicationController
	def new
		@client_token = Braintree::ClientToken.generate
		@reservation = Reservation.find(params[:id])
		@transaction = Transaction.new
		# byebug
	end

	def create
		# byebug
		amount = params[:transaction][:total_price]
		nonce = params[:payment_method_nonce]
		# byebug
		render action: :new and return unless nonce
		@result = Braintree::Transaction.sale(
			amount: amount,
			payment_method_nonce: params[:payment_method_nonce]
		)
		# byebug
		if @result.success?
		Transaction.create(reservation_id: params[:transaction][:reservation_id], braintree_transaction_id: @result.transaction.id, status: @result.transaction.status, last_4: @result.transaction.credit_card_details.last_4)
  
        redirect_to reservation_path(:id => params[:transaction][:reservation_id]), notice: "Congratulations! Your transaction is successful!"
        else
        flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
        @client_token = Braintree::ClientToken.generate
		@reservation = Reservation.find(params[:transaction][:reservation_id])
		@transaction = Transaction.new
        render :new
        end
		
	end
end
