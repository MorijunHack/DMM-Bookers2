class BooksController < ApplicationController
  def create
    @user = current_user
    @books = Book.all
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	@book.save
  	if @book.save
      flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book.id)
  	else
  		render :index
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
    if @book.user_id != current_user.id
      flash[:notice] = "You cannot edit this book."
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "Book was successfully editted."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
    if @book.destroy
      flash[:notice] = "Book was successfully deleted."
      redirect_to books_path
  	else
      render :index
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
