class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:favorites, :show, :edit, :update]

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def show
    @user_posts = current_user.posts.all
    @favorites = Favorite.where(user_id: @user.id).all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to home_path, notice: "編集内容を保存しました。"
    else
      render infomation_edit_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:account_name,:birthdate,:email,:image)
  end

  def set_user
    @user = current_user
  end
end
