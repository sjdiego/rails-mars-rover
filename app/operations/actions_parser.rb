module ActionsParser
  class Processer
    def call(vactions, plateau)
      final_positions = []

      vactions.each do |va|
        vehicle = va[0]
        actions = va[1][1]

        final_positions.push(execute(vehicle, actions, plateau))
      end

      return final_positions
    end

    private

    def execute(vehicle, actions, plateau)
      position_x = vehicle.x
      position_y = vehicle.y
      orientation = vehicle.orientation

      actions.each do |a|
        puts a.str
      end
    end
  end
end