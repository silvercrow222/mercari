require 'rails_helper'

describe Address do
  describe '#create' do
    # 1. postal_code以下の要素が存在すれば登録できること
    it "is valid with a postal_code, prefecture_id, city, block, apartment " do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. postal_codeが空では登録できないこと
    it "is valid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    # 3. prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    # 4. cityが空では登録できないこと
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    # 5. blockが空では登録できないこと
    it "is invalid without a block" do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("can't be blank")
    end
 
    # 6. apartmentが空では登録できないこと
    it "is invalid without a apartment" do
      address = build(:address, apartment: nil)
      address.valid?
      expect(address.errors[:apartment]).to include("can't be blank")
    end
  end
end