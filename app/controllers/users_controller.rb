class UsersController < ApplicationController
  	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.where(user_id: @user.id)
	end

	def index
		@book = Book.new
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			flash[:notice] = "You cannot edit this user."
			redirect_to user_path(current_user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "User was successfully editted."
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
