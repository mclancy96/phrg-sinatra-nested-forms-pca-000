class Ship < ApplicationRecord
  belongs_to :pirate

  # Disable inheritance since 'type' is a ship attribute, not inheritance column
  self.inheritance_column = :_type_disabled
end
