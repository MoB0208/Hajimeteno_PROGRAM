class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    # コメント
    @user_comments = @user.comments.all
    @user_comments = Kaminari.paginate_array(@user_comments).page(params[:page]).per(5)
    # 記事
    @user_posts = @user.posts.all
    @user_posts = Kaminari.paginate_array(@user_posts).page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: "ステータスを更新しました。"
    else
      render edit_admins_user_path(@user)
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
