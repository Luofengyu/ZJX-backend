class Order < ApplicationRecord
  has_many :waybills

  has_one :waybill

  has_many :items
  has_many :product_items


end
