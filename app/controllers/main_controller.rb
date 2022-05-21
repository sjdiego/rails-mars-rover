class MainController < ApplicationController
  def index
    @title = 'Mars Rover'
  end

  def submit
    commands = params[:input_commands].split("\n")
    commands = commands.reject { |c| c.empty? }
    plateau_cmd = commands[0]
    commands.shift # Remove plateau coords to have only vehicles and actions

    plateau = ::CommandsParser::Plateaus.new.get(plateau_cmd)
    vehicles = ::CommandsParser::Vehicles.new.get(commands)
    actions = ::CommandsParser::Actions.new.get(commands)

    vactions = vehicles.zip(actions)
    final_positions = ::ActionsParser::Processer.new.call(vactions, plateau)

    return render :json => {
      :final_positions => final_positions
    }, :status => :created
  end
end
