class CitiesPromotionRule < ApplicationRecord
  belongs_to :city
  belongs_to :promotion_rule
end
