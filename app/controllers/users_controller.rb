class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def index
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])

  end

  def update
    @user = User.update(user_params)
    if @user
      redirect_to users_path
    else
      flash[:alert] = "Hubo un error en la actualizacion de datos"
      render 'edit'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
