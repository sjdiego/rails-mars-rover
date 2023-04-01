# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @title = 'Mars Rover'
  end

  def submit
    if params[:input_commands].nil?
      return render json: {
        error: 'Missing parameters'
      }, status: :unprocessable_entity
    end

    commands = params[:input_commands].split("\n")
    commands = commands.reject(&:empty?)

    if commands.empty?
      return render json: {
        error: 'Error parsing parameters'
      }, status: :unprocessable_entity
    end

    plateau_cmd = commands[0]
    commands.shift

    plateau  = ::CommandsParser::Plateaus.new.get(plateau_cmd)
    vehicles = ::CommandsParser::Vehicles.new.get(commands)
    actions  = ::CommandsParser::Actions.new.get(commands)

    vactions = vehicles.zip(actions)
    final_positions = ::ActionsParser::Processer.new.call(vactions, plateau)

    output_textbox = ''
    final_positions.each do |v|
      output_textbox += "#{v.x} #{v.y} #{v.orientation}\n"
    end

    render json: {
      final_positions:,
      html: render_to_string(
        partial: 'partials/output-box',
        locals: { output_textbox: }
      )
    }, status: :created
  end
end
