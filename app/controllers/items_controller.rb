class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :sold, only: [:edit, :update, :destroy]


  def index
    @item = Item.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
     @item.destroy
     redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit( :image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def sold
    redirect_to root_path if @item.purchase.presence
  end
end
