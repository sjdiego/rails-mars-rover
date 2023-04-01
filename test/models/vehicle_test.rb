# frozen_string_literal: true

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test 'should create a valid vehicle' do
    assert Vehicle.new(1, 1, 'N').valid?
  end

  test 'should create a valid vehicle in another position' do
    assert Vehicle.new(130, 723, 'S').valid?
  end

  test 'should fail creating a vehicle with invalid orientation' do
    assert_not Vehicle.new(130, 723, 'G').valid?
  end

  test 'should fail creating a vehicle with bad position parameters' do
    assert_not Vehicle.new(-1, 0.00000000003123, 'N').valid?
  end

  test 'should fail creating a vehicle without parameters' do
    assert_raises(ArgumentError) { Vehicle.new(nil) }
  end

  test 'should fail creating a vehicle with bad parameters' do
    assert_raises(ArgumentError) { Vehicle.new('N', '1', '3', "\n").valid? }
  end
end
