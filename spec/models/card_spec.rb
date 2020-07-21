require 'rails_helper'

describe Cards do
  describe '#create' do
    # 1. user_id, customer_id, card_idが存在すれば登録できること
    it "is valid with a user_id, customer_id, card_id" do
      card = build(:card)
      expect(credit_card).to bi_valid
    end
    
    # 2, user_idが空では登録できないこと
    it "is invalid without a user_id" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

    # 3, customer_idが空では登録できないこと
    it "is invalid without a customer_id" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card,errors[:customer_id]).to include("can't be blank")
    end

    # 4, card_idが空では登録できないこと
    it "is invalid without a card_id" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end
