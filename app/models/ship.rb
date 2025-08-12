class Ship < ApplicationRecord
  # TODO: Set up associations with pirates
  # Use belongs_to to associate ships with pirates
  # Example: belongs_to :pirate

  # TODO: Add validations if needed
  # Example: validates :name, presence: true

  # NOTE: This lab uses ActiveRecord, so ships will be persisted to the database
  # The database table should have columns: name, type, booty, pirate_id
end
