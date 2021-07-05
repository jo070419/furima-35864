require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '新規登録できないとき' do
    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descriptionが空だと登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "status_idが空だと登録できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "shipping_charge_idが空だと登録できない" do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it "shipping_area_idが空だと登録できない" do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it "day_to_ship_idが空だと登録できない" do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship can't be blank")
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end
