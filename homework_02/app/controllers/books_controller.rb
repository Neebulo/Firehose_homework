class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(place_params)
    redirect_to root_path
  end

  private

  def place_params
    params.require(:book).permit(:title, :author, :genre, :classification, :prose, :year)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
