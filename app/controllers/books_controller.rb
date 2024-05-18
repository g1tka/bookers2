class BooksController < ApplicationController


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def show
  end

  def destroy

  end


  private

  def book_params
    params.require(:book).permit(:title,:opinion)
  end

end
