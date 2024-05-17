class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end


private

def user_params
  params.require(:user).permit(:name, :pofile_image, :introduction)
end

end