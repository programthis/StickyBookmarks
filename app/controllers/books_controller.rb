require 'open-uri'
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

    books_json = open("https://www.googleapis.com/books/v1/volumes?q=#{(params[:book][:name]).gsub(' ', '%20')}+inauthor:#{(params[:book][:author]).gsub(' ', '%20')}&key=#{Figaro.env.google_books_api}").read

    puts

    cover = JSON.parse(books_json)
    @book.cover = cover["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]


  	if @book.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def sort_by_recent
    @books = Book.all(order: "created_at DESC")
  end

  def sort_by_votes


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

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to root_path
  end

  private
  def book_params
  	params.require(:book).permit(:name, :author, :genre, :ISBN)
  end

end
