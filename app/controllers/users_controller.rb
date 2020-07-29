class UsersController < ApplicationController
  def show
  end

  def card
    if @card = Card.find_by(user_id: current_user.id)
      # Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :block, :apartment)
  end
end
