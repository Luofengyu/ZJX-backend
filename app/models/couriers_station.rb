class CouriersStation < ApplicationRecord
  has_and_belongs_to_many :stations
  has_and_belongs_to_many :couriers
end
