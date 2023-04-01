require "test_helper"

class ActionTest < ActiveSupport::TestCase
  test "should create a valid action to turn left" do
    assert Action.new("L").valid?
  end

  test "should create a valid action to turn right" do
    assert Action.new("L").valid?
  end

  test "should create a valid action to move forward" do
    assert Action.new("M").valid?
  end

  test "should fail creating an action with invalid action" do
    assert_not Action.new("G").valid?
  end

  test "should fail creating an action with another invalid action" do
    assert_not Action.new("7").valid?
  end

  test "should fail creating an action with multiple valid commands" do
    assert_not Action.new("GGG").valid?
  end

  test "should fail creating an action with multiple invalid commands" do
    assert_not Action.new("XAXXXASFFQAWLSLRL").valid?
  end

  test "should fail creating an action without parameters" do
    assert_raises(ArgumentError) { Vehicle.new(nil) }
  end
end
