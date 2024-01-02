class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @favorite_posts = current_user.favorite.post.all
    @user_post = current_user.post.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_infomation_edit_path(@user), notice: "編集内容を保存しました。"
    else
      render user_infomation_edit_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:account_name,:birthdate,:email,:image)
  end
end
