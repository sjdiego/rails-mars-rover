class Action
  include ActiveModel::API
  attr_accessor :action
  
  # Set the action to be performed on the vehicle
  def initialize(action)
    @action = action
  end

  # Validate the action (L: Left, R: Right, M: Move forward)
  validates :action, format: {with: /\A[LRM]\z/i}
end