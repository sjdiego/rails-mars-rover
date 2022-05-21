require "test_helper"

class PlateauTest < ActiveSupport::TestCase
  test "should create a valid plateau" do
    assert Plateau.new(5, 5).valid?
  end

  test "should create a huge valid plateau" do
    assert Plateau.new(100000000000, 100000000000).valid?
  end

  test "should not create an invalid plateau because is too small" do
    assert_not Plateau.new(1, 1).valid?
  end

  test "should not create an invalid plateau because params are invalid" do
    assert_not Plateau.new("a", "b").valid?
  end

  test "should raise an error because plateau has no params" do
    assert_raises(ArgumentError) { Plateau.new(nil) }
  end

  test "should raise an error because has valid but missing param" do
    assert_raises(ArgumentError) { Plateau.new(5) }
  end

  test "should raise an error because has invalid and missing param" do
    assert_raises(ArgumentError) { Plateau.new("a") }
  end

  test "should raise an error because has extra params" do
    assert_raises(ArgumentError) { Plateau.new(7, 7, "extra", 0, nil) }
  end
end
