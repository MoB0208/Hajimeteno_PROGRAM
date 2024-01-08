class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:favorites]

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def show
    @user = current_user
    # @favorite_posts = current_user.favorite_posts.all
    @user_posts = current_user.posts.all
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

  def set_user
    @user = User.find(params[:id])
  end
end
