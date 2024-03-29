# frozen_string_literal: true

class Vehicle
  include ActiveModel::API
  attr_accessor :x, :y, :orientation

  # Set the placement of the vehicle
  def initialize(x, y, orientation)
    @x = x.to_i
    @y = y.to_i
    @orientation = orientation.upcase
  end

  # Validate the vehicle position and orientation
  validates :x, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :y, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :orientation, format: { with: /\A[NESW]\z/ }
end
