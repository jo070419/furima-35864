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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it "descriptionが空だと登録できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it "category_idが1だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
    end
    it "status_idが空だと登録できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it "status_idが1だと登録できない" do
      @item.status_id= 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
    end
    it "shipping_charge_idが空だと登録できない" do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it "shipping_charge_idが1だと登録できない" do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
    end
    it "shipping_area_idが空だと登録できない" do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it "shipping_area_idが1だと登録できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
    end
    it "day_to_ship_idが空だと登録できない" do
      @item.day_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it "day_to_ship_idが1だと登録できない" do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
    end
    it "priceが空だと登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it "priceが¥300以下だと保存できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")  
    end
    it "priceが¥9,999,999以上だと保存できない" do
      @item.price = 10000000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")  
    end
    it "priceは半角数字でない場合は保存できない" do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")  
    end
    it "user_idが空だと登録できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")  
    end
  end
end
