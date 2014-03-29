class ScenesController < ApplicationController

  before_filter :load_book

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = @book.scenes.build(scene_params)
    @scene.user = current_user
    @scene.book = @book
    respond_to do |format|
      if @scene.save
        format.js
        format.html{redirect_to root_path}
      else
        format.js
        format.html{render :new}
      end
    end
  end

  def upvote
    @scene = Scene.find(params[:id])
    upvote_num = @scene.upvote.to_i
    upvote_num += 1
    @scene.upvote = upvote_num
    @scene.save
    redirect_to book_path(@book)
  end

  def downvote
    @scene = Scene.find(params[:id])
    downvote_num = @scene.downvote.to_i
    downvote_num += 1
    @scene.downvote = downvote_num
    @scene.save
    redirect_to book_path(@book)
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
