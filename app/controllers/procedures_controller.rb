class ProceduresController < ApplicationController
  def show
    @procedure = Procedure.find(params[:id])

    render json: @procedure.to_hash
  end
end
