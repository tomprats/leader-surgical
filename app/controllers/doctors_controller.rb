class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])

    render json: @doctor.to_hash
  end
end
