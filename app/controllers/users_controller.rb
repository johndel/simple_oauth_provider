class UsersController < ApplicationController
  before_action :user_params, only: [:create]
  before_action :authorize, except: :show

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User successfully created.' and return
    else
      redirect_to new_user_path, notice: 'Error.' and return
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :is_admin)
    end
end