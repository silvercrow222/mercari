require 'rails_helper'

describe Product do
  describe '#create' do
    it "is valid with being full" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is valid without size" do
      product = build(:product, size: nil)
      expect(product).to be_valid
    end

    it "is valid without brand_id" do
      product = build(:product, brand_id: nil)
      expect(product).to be_valid
    end

    it "is valid without buyer_id" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a detail" do
      product = build(:product, detail: "")
      product.valid?
      expect(product.errors[:detail]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a condition" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "is invalid without a day" do
      product = build(:product, day: nil)
      product.valid?
      expect(product.errors[:day]).to include("を入力してください")
    end

    it "is invalid without a shipping" do
      product = build(:product, shipping: nil)
      product.valid?
      expect(product.errors[:shipping]).to include("を入力してください")
    end

    it "is invalid without a fee" do
      product = build(:product, fee: nil)
      product.valid?
      expect(product.errors[:fee]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      product = build(:product, user_id: nil)
      product.valid?
      expect(product.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid when price is less than 300" do
      product = build(:product, price: 100)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    it "is invalid when price is more than 9999999" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end
