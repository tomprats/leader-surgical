class Admin::SpecialtiesController < AdminController
  def index
    @specialty = Specialty.new
  end

  def edit
    @specialty = Specialty.find(params[:id])

    render :index
  end

  def create
    @specialty = Specialty.new(specialty_params)
    if @specialty.save
      redirect_to({ action: :index }, success: "#{@specialty.name} created")
    else
      render :index, warning: @specialty.errors.full_messages.join(", ")
    end
  end

  def update
    @specialty = Specialty.find(params[:id])
    if @specialty.update(specialty_params)
      redirect_to({ action: :index }, success: "#{@specialty.name} updated")
    else
      render :index, warning: @specialty.errors.full_messages.join(", ")
    end
  end

  def destroy
    @specialty = Specialty.find(params[:id])
    @specialty.destroy
    redirect_to({ action: :index }, danger: "#{@specialty.name} deleted")
  end

  private
  def specialty_params
    params.require(:specialty).permit(
      :active, :parent_id, :doctor_id,
      :name, :link, :description
    )
  end
end
