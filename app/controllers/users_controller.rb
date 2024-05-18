class UsersController < ApplicationController
  
  def index
  end  
    
  def show
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
    @user.update(user_params)
    redirect_to user_path(@user)
  end


private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end