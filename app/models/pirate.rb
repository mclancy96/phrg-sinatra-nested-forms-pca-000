class Pirate < ApplicationRecord
  has_many :ships, dependent: :destroy
  accepts_nested_attributes_for :ships
end
