class Admin::FAQsController < AdminController
  def index
    @faq = FAQ.new
  end

  def edit
    @faq = FAQ.find(params[:id])

    render :index
  end

  def create
    @faq = FAQ.new(faq_params)
    if @faq.save
      redirect_to({ action: :index }, success: "FAQ created")
    else
      render :index, warning: @faq.errors.full_messages.join(", ")
    end
  end

  def update
    @faq = FAQ.find(params[:id])
    if @faq.update(faq_params)
      redirect_to({ action: :index }, success: "FAQ updated")
    else
      render :index, warning: @faq.errors.full_messages.join(", ")
    end
  end

  def destroy
    @faq = FAQ.find(params[:id])
    @faq.destroy
    redirect_to({ action: :index }, danger: "FAQ deleted")
  end

  private
  def faq_params
    params.require(:faq).permit(
      :active, :rank,
      :question, :answer
    )
  end
end
