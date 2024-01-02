class User::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  end

  def edit
  end

  def update
  end
  
  private

  def user_params
    params.require(:user).permit(:account_name,:birthdate,:email)
  end
end
