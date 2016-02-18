class Admin::BodyPartsController < AdminController
  def index
    @body_part = BodyPart.new
  end

  def edit
    @body_part = BodyPart.find(params[:id])

    render :index
  end

  def create
    @body_part = BodyPart.new(body_part_params)
    if @body_part.save
      redirect_to({ action: :index }, success: "#{@body_part.name} created")
    else
      render :index, warning: @body_part.errors.full_messages.join(", ")
    end
  end

  def update
    @body_part = BodyPart.find(params[:id])
    if @body_part.update(body_part_params)
      redirect_to({ action: :index }, success: "#{@body_part.name} updated")
    else
      render :index, warning: @body_part.errors.full_messages.join(", ")
    end
  end

  def destroy
    @body_part = BodyPart.find(params[:id])
    @body_part.destroy
    redirect_to({ action: :index }, danger: "#{@body_part.name} deleted")
  end

  private
  def body_part_params
    params.require(:body_part).permit(
      :active, :doctor_id, :name,
      :color, :coords, :description
    )
  end
end
