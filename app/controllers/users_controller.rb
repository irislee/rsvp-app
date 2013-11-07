class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(event_params)
    redirect_to @user if @user.save
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to users_url if @user.destroy
  end

  private
    def event_params
      params.require(:user).permit(:name)
    end
end