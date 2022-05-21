class Action
  include ActiveModel::API
  attr_accessor :str

  # Set the action to be performed on the vehicle
  def initialize(str)
    @str = str
  end

  # Validate the action (L: Left, R: Right, M: Move forward)
  validates :str, format: {with: /\A[LRM]\z/i}
end