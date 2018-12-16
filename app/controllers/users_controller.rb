class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: %i[edit update show]}
  before_action :set_user, {only: %i[show edit update]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to tops_index_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to tops_index_path, alert: "権限がありません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
