module ActionsParser
  class Processer
    def call(vactions, _plateau)
      final_positions = []

      vactions.each do |va|
        vehicle = va[0]
        actions = va[1][1]

        final_position = execute(vehicle, actions)

        # Check if final position is inside boundaries of plateau

        final_positions.push(final_position)
      end

      return final_positions
    end

    private

    def execute(vehicle, actions)
      actions.each do |act|
        vehicle = case act.str
                  when "M"
                    ::DisplacerVehicle::Move.new.forward(vehicle)
                  when "L"
                    ::SpinnerVehicle::Spin.new.left(vehicle)
                  when "R"
                    ::SpinnerVehicle::Spin.new.right(vehicle)
                  end
      end

      return vehicle
    end

    def valid_position(coords, plateau)
      return (coords.x >= 0 && coords.x < plateau.x) && (coords.y >= 0 && coords.y < plateau.y)
    end
  end
end
