class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

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
      redirect_to admin_users_edit_path(@user), notice: "ステータスを更新しました。"
    else
      render admin_users_edit_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:status)
  end
end
