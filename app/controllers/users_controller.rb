class UsersController < ApplicationController
  
  def index
    @users = User.all
    @user = User.find(current_user.id)
   
  end
  
  def edit
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
end
