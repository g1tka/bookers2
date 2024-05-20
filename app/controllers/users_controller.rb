class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    if current_user && params[:id] == current_user.id.to_s
      @user = current_user
      @books = @user.books
    else params[:id]
      @user = User.find(params[:id])
      @books = @user.books
    end

  end

  def edit
    # if params[:id] == current_user.id.to_s
      @user = User.find(params[:id])
    # else
      # redirect_to user_path(params[:id])
    # end
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


private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end