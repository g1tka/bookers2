class UsersController < ApplicationController
  
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :new
    end
  end


private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end