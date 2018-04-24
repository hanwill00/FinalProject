class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create, :following]
  before_action :authenticate_user, except: [:index, :show, :new, :create]

  def authenticate
    redirect_to login_path unless logged_in?
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    redirect_to root_path unless @user == current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def update
    if @user == current_user && @user.update(user_params)
      redirect_to @user
      session[:user_id] = @user.id
    else
      render :edit
    end
  end

  def destroy
    @user.destroy if @user == current_user
    reset_session
    redirect_to users_path
  end

  def following
  end

  def follow
    current_user.follow(@user)
    redirect_back(fallback_location: @user)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_back(fallback_location: current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_hash)
  end
end
