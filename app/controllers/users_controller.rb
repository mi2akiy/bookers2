class UsersController < ApplicationController
  
  def index
   
  end
  
  def edit
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
end
