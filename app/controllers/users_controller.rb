class UsersController < ApplicationController
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
    @user = User.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
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
    params.require(:user).permit(:name, :profile_image, :introduce)
  end

end
