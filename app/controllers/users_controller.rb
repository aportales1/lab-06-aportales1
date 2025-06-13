class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource
  def index
    redirect_to chats_path, alert: "You are not authorized to see all users." unless can? :manage, User
    @users = User.all
  end
  
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user, notice: "User created successfully."
    else 
    render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end