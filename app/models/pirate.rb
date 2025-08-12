class Pirate < ApplicationRecord
  # TODO: Set up associations with ships
  # Use has_many to associate pirates with ships
  # Example: has_many :ships

  # TODO: Set up nested attributes for ships
  # Use accepts_nested_attributes_for to allow creating ships through pirate forms
  # Example: accepts_nested_attributes_for :ships

  # TODO: Add validations if needed
  # Example: validates :name, presence: true

  # NOTE: This lab uses ActiveRecord, so pirates will be persisted to the database
  # The database table should have columns: name, weight, height
end
