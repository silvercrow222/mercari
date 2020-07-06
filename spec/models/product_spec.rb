require 'rails_helper'

describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a detail" do
      product = build(:product, detail: "")
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end
  end
end