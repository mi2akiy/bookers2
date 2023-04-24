class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def index
    @books = Book.all
    render :index
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user.id
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
