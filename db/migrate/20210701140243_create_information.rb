class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string      :postal_code,          null: false
      t.integer     :shipping_area_id,     null: false
      t.string      :municipality,         null: false
      t.string      :house_number,         null: false
      t.string      :building
      t.string      :phone_namber,         null: false
      t.timestamps
    end
  end
end
