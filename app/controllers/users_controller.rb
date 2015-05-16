class UsersController < ApplicationController
	before_action :authenticate_user!


	def index
		@media = current_user.media
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
		@media = @user.media
		render :show
	end
end
