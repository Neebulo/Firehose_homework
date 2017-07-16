class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:q]
      # search for books with the given query string
      @books = Book.includes(:authors).where("title LIKE ? OR authors.first_name LIKE ? OR authors.last_name LIKE ? OR classification LIKE ? OR genre LIKE ? OR prose LIKE ? OR sub_title LIKE ?", 
                          "%#{params[:q]}%", "%#{params[:q]}%",  "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      # return all books
      @books = Book.includes(:authors)
    end
  end

  def new
    @book = Book.new
  end

  def create
    current_user.books.create(book_params)
    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to root_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :classification, :prose, :year, :sub_title)
  end
end
