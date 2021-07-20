class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :house_number, :building, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipping_area_id, numericality: {other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Information.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end