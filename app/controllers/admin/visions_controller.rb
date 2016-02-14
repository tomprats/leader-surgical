class Admin::VisionsController < AdminController
  def index
    @vision = Vision.new
  end

  def edit
    @vision = Vision.find(params[:id])

    render :index
  end

  def create
    @vision = Vision.new(vision_params)
    if @vision.save
      redirect_to({ action: :index }, success: "Vision created")
    else
      render :index, warning: @vision.errors.full_messages.join(", ")
    end
  end

  def update
    @vision = Vision.find(params[:id])
    if @vision.update(vision_params)
      redirect_to({ action: :index }, success: "Vision updated")
    else
      render :index, warning: @vision.errors.full_messages.join(", ")
    end
  end

  def destroy
    @vision = Vision.find(params[:id])
    @vision.destroy
    redirect_to({ action: :index }, danger: "Vision deleted")
  end

  private
  def vision_params
    params.require(:vision).permit(
      :active, :rank,
      :title, :text
    )
  end
end
