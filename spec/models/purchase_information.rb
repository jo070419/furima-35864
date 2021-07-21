require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_information = FactoryBot.build(:purchase_information, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  context '購入できるとき' do
    it "item_id,user_id,token,postal_code,shipping_area_id,municipality,house_number,phone_numberが存在すれば登録できる" do
      expect(@purchase_information).to be_valid
    end
    it "buildingが空でも登録できる" do
      @purchase_information.building = ''
      expect(@purchase_information).to be_valid
    end
  end
  context '購入できない時' do
    it "user_idが空だと登録できない" do
      @purchase_information.user_id = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと登録できない" do
      @purchase_information.item_id = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空だと登録できない" do
      @purchase_information.token = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空だと登録できない" do
      @purchase_information.postal_code = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeはハイフンが抜けていると登録できない" do
      @purchase_information.postal_code = '1000000'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Postal code is invalid")
    end
    it "shipping_area_idが空だと登録できない" do
      @purchase_information.shipping_area_id = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Shipping area can't be blank")
    end
    it "municipalityが空だと登録できない" do
      @purchase_information.municipality = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Municipality can't be blank")
    end
    it "house_numberが空だと登録できない" do
      @purchase_information.house_number = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが空だと登録できない" do
      @purchase_information.phone_number = ''
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが9桁以下だと登録できない" do
      @purchase_information.phone_number = '100000000'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが12桁以上だと登録できない" do
      @purchase_information.phone_number = '100000000000'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが半角数字でないと登録できない" do
      @purchase_information.phone_number = '１００００００００００'
      @purchase_information.valid?
      expect(@purchase_information.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
