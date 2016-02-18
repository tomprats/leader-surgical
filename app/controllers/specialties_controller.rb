class SpecialtiesController < ApplicationController
  def show
    @specialty = Specialty.find(params[:id])

    render json: @specialty.to_hash
  end
end
