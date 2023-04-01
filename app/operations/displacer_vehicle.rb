module DisplacerVehicle
  class Move
    def forward(vehicle)
      x_axis = {
        "N" => vehicle.x,
        "S" => vehicle.x,
        "E" => vehicle.x + 1,
        "W" => vehicle.x - 1,
      }

      y_axis = {
        "E" => vehicle.y,
        "W" => vehicle.y,
        "N" => vehicle.y + 1,
        "S" => vehicle.y - 1,
      }

      vehicle.x = x_axis[vehicle.orientation]
      vehicle.y = y_axis[vehicle.orientation]

      return vehicle
    end
  end
end
