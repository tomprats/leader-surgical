class Admin::ProceduresController < AdminController
  before_action :set_variables, only: [:index, :edit, :create, :update]

  def index
    @procedure = Procedure.new
  end

  def edit
    @procedure = Procedure.find(params[:id])

    render :index
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      redirect_to({ action: :index }, success: "#{@procedure.name} created")
    else
      render :index, warning: @procedure.errors.full_messages.join(", ")
    end
  end

  def update
    @procedure = Procedure.find(params[:id])
    if @procedure.update(procedure_params)
      redirect_to({ action: :index }, success: "#{@procedure.name} updated")
    else
      render :index, warning: @procedure.errors.full_messages.join(", ")
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    redirect_to({ action: :index }, danger: "#{@procedure.name} deleted")
  end

  private
  def set_variables
    @procedures = Procedure.all
    @specialties = Specialty.all
  end

  def procedure_params
    params.require(:procedure).permit(
      :active, :specialty_id,
      :name, :link, :description
    )
  end
end
