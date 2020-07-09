require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#update' do
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "is valid with a name" do
      user = create(:user)
      product = build(:product)
      expect(product).to be_valid
    end
  end
end