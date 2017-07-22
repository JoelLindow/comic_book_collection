class CollectionController < ApplicationController
  def index
    @books = current_user.books if current_user
  end

  def new
    book = Book.find(params[:book_id])
    if current_user.books.include?(book)
      flash[:alert] = "#{book.title} is already in your collection"
    else
      current_user.books << book
      flash[:success] = "#{book.title} was added to your collection"
    end
    redirect_to books_path
  end

  def destroy
    current_user.books.delete(Book.find(params[:book_id]))
    redirect_to collection_path
  end
end
