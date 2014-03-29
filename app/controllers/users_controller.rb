class UsersController < ApplicationController


	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user.destroy
		redirect_to :back
	end

end
