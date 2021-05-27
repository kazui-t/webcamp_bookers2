class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @books = Book.all
    @book_new = Book.new
  end

  def edit
    unless current_user.id == params[:id].to_i
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id]) # find DB にアクセス
    # unless @user.id == current_user.id
    #   redirect_to user_path(current_user.id)
    # end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "User was successfully updated."
    else
      render action: :edit and return
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
