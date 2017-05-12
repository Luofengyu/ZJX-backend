class SettlementRule < ApplicationRecord
  belongs_to :category
  belongs_to :city
end
