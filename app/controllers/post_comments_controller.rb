class PostCommentsController < ApplicationController

  def create
    @book_show = Book.find(params[:book_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.book_id = @book_show.id
    @post_comment.save
    # redirect_to book_path(book)
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    @book_show = Book.find(params[:book_id])
    # redirect_to book_path(@book.id)
  end

private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end




end
