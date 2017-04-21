class StationAddress < ApplicationRecord
  has_and_belongs_to_many :couriers
  has_and_belongs_to_many :factories
end
