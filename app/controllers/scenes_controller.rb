class ScenesController < ApplicationController

  before_filter :load_book

  def index
    @scenes = Scenes.all
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = @book.scene.build(scene_params)
    @scene.user = current_user
    @scene.book = @book
    respond_to do |format|
      if @book.save
        format.js
        format.html{redirect_to root_path}
      else
        format.js
        format.html{render :new}
      end
  end

  def destroy
    @scene = Scene.find(params[:id])
    @scene.destroy
    redirect_to book_path(@book)
  end

  private
  def scene_params
    params.require(:scene).permit(:chapter, :page)
  end

  def load_book
    @book = Book.find(params[:book_id])
  end

end
