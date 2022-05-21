module CommandsParser
  #
  # It parses commands to obtain a valid Plateau model
  #
  class Plateaus
    def get(plateau_cmd)
      coords = plateau_cmd.split(" ")

      plateau = Plateau.new(coords[0], coords[1])

      return plateau.valid? ? plateau : nil
    end
  end

  #
  # It parses commands to obtain valid Vehicle models
  #
  class Vehicles
    def get(commands)
      vehicles = []

      # https://www.rubyguides.com/2019/04/ruby-select-method/
      vehicleItems = commands.select.with_index { |_, i| i.even? }

      vehicleItems.each do |v|
        vehicleValues = v.split(" ")

        vehicle = Vehicle.new(vehicleValues[0], vehicleValues[1], vehicleValues[2])

        if vehicle.valid?
          vehicles.push(vehicle)
        end
      end

      return vehicles
    end
  end

  #
  # It parses commands to obtain valid Action models
  #
  class Actions
    def get(commands)
      actions = Hash.new { |hash, key| hash[key] = Array.new }

      # https://www.rubyguides.com/2019/04/ruby-select-method/
      actionItems = commands.select.with_index { |_, i| i.odd? }

      actionItems.select.each_with_index do |str, idx|
        str.split(" ").each do |a|
          action = Action.new(a)

          if action.valid?
            actions[idx].push(action)
          end
        end
      end

      return actions
    end
  end
end