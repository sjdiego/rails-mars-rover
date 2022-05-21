module ActionsParser
  class Processer
    def call(vactions, plateau)
      final_positions = []

      vactions.each do |va|
        vehicle = va[0]
        actions = va[1][1]

        final_positions.push(execute(vehicle, actions))
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
  end
end