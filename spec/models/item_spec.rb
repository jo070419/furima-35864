require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '新規登録できるとき' do
    it "image,name,description,category_id,status_id,shipping_charge_id,shipping_area_id,day_to_ship_id,price,user_idが存在すれば登録できる" do
    expect(@item).to be_valid
    end
  end
  context '新規登録できないとき' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
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
    it "category_idが1だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "status_idが空だと登録できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "status_idが1だと登録できない" do
      @item.status_id= 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "shipping_charge_idが空だと登録できない" do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it "shipping_charge_idが1だと登録できない" do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it "shipping_area_idが空だと登録できない" do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it "shipping_area_idが1だと登録できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end
    it "day_to_ship_idが空だと登録できない" do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship can't be blank")
    end
    it "day_to_ship_idが1だと登録できない" do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが¥300以下だと保存できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")  
    end
    it "priceが¥9,999,999以上だと保存できない" do
      @item.price = 10000000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")  
    end
    it "priceは半角数字でない場合は保存できない" do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")  
    end
    it "user_idが空だと登録できない" do
      @item.user_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")  
    end
  end
end
