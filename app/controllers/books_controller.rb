class BooksController < ApplicationController

  # def new
    # @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end

  end

  def index
    @book = Book.new
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @books = Book.includes(:favorites).
      sort{|a,b|
        b.favorites.where(created_at: from...to).count <=>
        a.favorites.where(created_at: from...to).count
      }
    @user = User.find_by(id:current_user.id)
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find_by(id:@book.user_id)
    @post_comment = PostComment.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end

  end

private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
