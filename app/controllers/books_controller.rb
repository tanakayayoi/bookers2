class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @user = current_user
    @book.update(book_params)
    redirect_to book_path(@user.id)
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @user = current_user
    @book.destroy
    redirect_to book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
