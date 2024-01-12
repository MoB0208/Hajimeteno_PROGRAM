class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update]

  def index
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
      redirect_to admins_users_show_path(@user), notice: "ステータスを更新しました。"
    else
      render admins_users_edit_path(@user)
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:account_name,:birthdate,:email,:image,:status)
  end
end
