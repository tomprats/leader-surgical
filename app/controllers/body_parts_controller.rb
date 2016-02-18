class BodyPartsController < ApplicationController
  def show
    @body_part = BodyPart.find(params[:id])

    render json: @body_part.to_hash
  end
end
