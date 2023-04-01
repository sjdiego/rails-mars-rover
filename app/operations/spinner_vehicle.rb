# frozen_string_literal: true

module SpinnerVehicle
  class Spin
    def right(vehicle)
      orientations = {
        'N' => 'E',
        'E' => 'S',
        'S' => 'W',
        'W' => 'N'
      }

      vehicle.orientation = orientations[vehicle.orientation]

      vehicle
    end

    def left(vehicle)
      orientations = {
        'N' => 'W',
        'E' => 'N',
        'S' => 'E',
        'W' => 'S'
      }

      vehicle.orientation = orientations[vehicle.orientation]

      vehicle
    end
  end
end
