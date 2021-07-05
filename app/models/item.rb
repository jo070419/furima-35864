class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingcharge
  belongs_to :shippingarea
  belongs_to :daytoship

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :day_to_ship_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with:/^[0-9]+$/, multiline: true }
    validates :user_id
    with_options numericality: {other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :day_to_ship_id
    end
  end
end
