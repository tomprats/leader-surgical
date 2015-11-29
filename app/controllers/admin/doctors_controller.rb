class Admin::DoctorsController < AdminController
  before_action :set_variables, only: [:index, :edit, :create, :update]

  def index
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])

    render :index
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to({ action: :index }, success: "#{@doctor.name} created")
    else
      render :index, warning: @doctor.errors.full_messages.join(", ")
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to({ action: :index }, success: "#{@doctor.name} updated")
    else
      render :index, warning: @doctor.errors.full_messages.join(", ")
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to({ action: :index }, danger: "#{@doctor.name} deleted")
  end

  private
  def set_variables
    @doctors = Doctor.all
    @specialties = Specialty.all
  end

  def doctor_params
    params.require(:doctor).permit(
      :active, :specialty_id, :image,
      :first_name, :last_name,
      :kind, :description,
      :bio, :accolades,
      :password, :password_confirmation
    )
  end
end
