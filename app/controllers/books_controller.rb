class BooksController < ApplicationController


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
    # 成功したら、books/:idへ行きたい。×ならbooks
  end

  def index
    @books = Book.all

    @user = User.find_by(params[:id])
  end

  def edit
  end

  def show
  end

  def destroy
  end


  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
