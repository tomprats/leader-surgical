class Admin::PagesController < AdminController
  def index
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])

    render :index
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to({ action: :index }, success: "#{@page.name} created")
    else
      render :index, warning: @page.errors.full_messages.join(", ")
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to({ action: :index }, success: "#{@page.name} updated")
    else
      render :index, warning: @page.errors.full_messages.join(", ")
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to({ action: :index }, danger: "#{@page.name} deleted")
  end

  private
  def page_params
    params.require(:page).permit(
      :specialty_id, :active, :rank,
      :path, :name, :text
    )
  end
end
