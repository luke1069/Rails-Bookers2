class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = User.find_by(id: current_user.id)
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books

    # try chat機能
    @currentuserentry = Entry.where(user_id: current_user.id)
    @userentry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentuserentry.each do |cu|
        @userentry.each do |u|
          if cu.room_id == u.room_id
            @havaroom = true
            @roomid = cu.room_id
          end
        end
      end
    end
    unless @haveroom
      @room = Room.new
      @entry = Entry.new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
