class Admin::VisitsController < AdminController
  def index
    @visit = Visit.new
  end

  def edit
    @visit = Visit.find(params[:id])

    render :index
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      redirect_to({ action: :index }, success: "#{@visit.name} created")
    else
      render :index, warning: @visit.errors.full_messages.join(", ")
    end
  end

  def update
    @visit = Visit.find(params[:id])
    if @visit.update(visit_params)
      redirect_to({ action: :index }, success: "#{@visit.name} updated")
    else
      render :index, warning: @visit.errors.full_messages.join(", ")
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to({ action: :index }, danger: "#{@visit.name} deleted")
  end

  private
  def visit_params
    params.require(:visit).permit(
      :active, :rank, :parent_id,
      :name, :file, :description
    )
  end
end
