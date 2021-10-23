class BooksController < ApplicationController

  # def new
    # @book = Book.new
  # end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice] = "You have created book successfully."
    end
    redirect_to user_path(book.user_id)
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find_by(id:current_user.id)
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user = User.find_by(id:@book_show.user_id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.user_id = current_user.id
    if book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    end
    redirect_to book_path(book.id)
  end

private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
