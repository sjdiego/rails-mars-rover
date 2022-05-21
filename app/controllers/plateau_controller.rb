class PlateauController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    plateau = Plateau.new(params[:x], params[:y])

    if !plateau.valid?
      return render :json => { 
        :errors => plateau.errors.full_messages 
      }, :status => :unprocessable_entity
    end

    return render :json => { 
      :message => "Plateau created successfully with size #{plateau.x},#{plateau.y}" 
    }, :status => :created
  end

  private

  def plateau_params
    params.require([:x, :y])
  end
end
