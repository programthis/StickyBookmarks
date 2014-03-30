class BooksController < ApplicationController

  def index
  	@books = Book.all
    respond_to do |format|
      format.html
      format.json {
        render json: @books.to_json(only: [:name])
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

  def sort_by_recent
    @books = Book.all(order: "created_at DESC")
  end

  def sort_by_popular

  end

  def search
    @books = Book.where("name iLIKE ?","%#{params[:search]}%")
    render :index
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
