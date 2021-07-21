class PurchasesController < ApplicationController
  before_action :cannot_be_purchased
  before_action :set_item
  before_action :sold

  def index
    @purchase_information = PurchaseInformation.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_information = PurchaseInformation.new(purchase_params)
    if @purchase_information.valid?
      pay_item
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_information).permit(:postal_code, :shipping_area_id, :municipality, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def cannot_be_purchased
    redirect_to root_path unless current_user
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold
    redirect_to root_path if @item.purchase.presence
  end
end
