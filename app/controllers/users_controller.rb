class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search].nil?
      @users = User.all
    else
      @users = User.search(params[:search])
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
  end
end
