class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.find(current_user.id)
   
  end
  
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end