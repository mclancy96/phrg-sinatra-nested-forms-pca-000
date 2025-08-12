class Pirate
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :name, :weight, :height, :id

  @@all = []

  def initialize(attributes = {})
    super
    @id = self.class.all.length + 1
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all.find { |pirate| pirate.id == id.to_i }
  end

  def persisted?
    false
  end
end
