class BooksController < ApplicationController
  def index
    @books = Book.order(params[:sort])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book successfully added to shelf."
      redirect_to books_url
    else
      render 'new'
      flash[:alert] = "Title and author cannot be empty"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = "Book updated."
      redirect_to @book 
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path
  end

  private

    private
    def book_params
      params.require(:book).permit(:title, :author, :id)
    end
end
