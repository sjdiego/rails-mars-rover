# frozen_string_literal: true

class Plateau
  include ActiveModel::API
  attr_accessor :x, :y

  # Set the max size of the plateau
  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  # Validate the plateau size
  validates :x, numericality: { only_integer: true, greater_than_or_equal_to: 5 }
  validates :y, numericality: { only_integer: true, greater_than_or_equal_to: 5 }
end
