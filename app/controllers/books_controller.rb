class BooksController < ApplicationController
  def index
  	@books = Book.all
    respond_to do |format|
      format.html
      format.json {
        render json: @books.to_json(only: [:name, :author])
      }
    end
  end

  def show
  	@book = Book.find(params[:id])
  	@scene = Scene.new
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update_attributes(book_params)
  		redirect_to book_path(params[:id])
  	else
  		render :edit
  	end
  end

  def delete
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to root_path
  end

  private
  def book_params
  	params.require(:book).permit(:name, :author, :genre, :ISBN)
  end

end
