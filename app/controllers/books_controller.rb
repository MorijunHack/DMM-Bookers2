class BooksController < ApplicationController
  def create
  	book = Book.new(book_params)
  	book.user_id = current_user.id
  	book.save
  	if book.save
      flash[:notice] = "Book was successfully created."
  		redirect_to book_path(book)
  	else
  		render books_path
  	end
  end

  def index
  	@user = current_user
  	@book = Book.new
  	@books = Book.all
  end

  def show
  	@user = Book.find(params[:id]).user
  	@book = Book.new
  	@current_book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
    if book.update(book_params)
      flash[:notice] = "Book was successfully editted."
      redirect_to book_path(book)
    else
      render edit_book_path(book)
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
    if @book.destroy
      flash[:notice] = "Book was successfully deleted."
      redirect_to books_path
  	else
      render book_path(book)
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
