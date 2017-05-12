class Coupon < ApplicationRecord
  belongs_to :coupon_list
  belongs_to :user
end
