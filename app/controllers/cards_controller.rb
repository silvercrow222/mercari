class CardsController < ApplicationController
  require "payjp"
  
  def new
    card = Card.where(user_id: current_user.id)
    #redirect_to action: :show if card.exists?
  end

  def pay
    #Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: :show
      else
        render :pay
      end
    end
  end

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card.present?
      # Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: :new
  end

  def show
    card = Card.where(user_id: current_user.id).first
    # Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end
end
