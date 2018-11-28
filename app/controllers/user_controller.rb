class UserController < ApplicationController

  def new
    @users = USERS
  end

  def create
    if params[:password].size < 6
      flash[:notice] = "password too short"
      redirect_to new_path
    else
      last = USERS.keys.last
      @id = last += 1
      @user = Hash.new(0)
      @user = {@id => {username: params[:username], password: params[:password]}}
      USERS.merge!(@user)
      redirect_to new_path
    end
  end
end
