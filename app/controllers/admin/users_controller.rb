class Admin::UsersController < AdminController
  before_action :set_variables, only: [:index, :edit, :create, :update]

  def index
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])

    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to({ action: :index }, success: "#{@user.name} created")
    else
      render :index, warning: @user.errors.full_messages.join(", ")
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to({ action: :index }, success: "#{@user.name} updated")
    else
      render :index, warning: @user.errors.full_messages.join(", ")
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.email == "tprats108@gmail.com"
      redirect_to({ action: :index }, danger: " You can't delete the creator")
    else
      @user.destroy
      redirect_to({ action: :index }, danger: "#{@user.name} deleted")
    end
  end

  def set_variables
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(
      :admin, :email,
      :first_name, :last_name,
      :password, :password_confirmation
    )
  end
end
