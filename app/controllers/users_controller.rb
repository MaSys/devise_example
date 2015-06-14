class UsersController < ApplicationController
  # before_action :set_user, only: [:edit, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    generated_password = Devise.friendly_token.first(8)
    user = User.create!(
      email: params[:user][:email],
      password: generated_password
    )
    user.send_reset_password_instructions
    UserMailer.welcome(user).deliver
    redirect_to users_path
  end

  def edit
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
