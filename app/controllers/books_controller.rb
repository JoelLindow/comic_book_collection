class BooksController < ApplicationController
  before_action :logged_in, only: [:new, :edit, :create, :update]

  def index
    @books = Book.all
  end

  def new
    @series = Series.order(:name)
    @brands = Brand.order(:name)
    @book   = Book.new
  end

  def create
    @series   = Series.order(:name)
    @book     = Book.new(book_params)
    @brands   = Brand.order(:name)
    if @book.save
      current_user.books << @book if current_user
      flash[:success] = "You created #{@book.title}"
      redirect_to book_path(@book)
    else
      flash.now[:alert] = @book.errors.full_messages.join(" ,")
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @series = Series.order(:name)
    @brands = Brand.order(:name)
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:success] = "#{@book.title} updated!"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :issue_number, :img_url, :brand_id, :description, :series_id)
  end
end
