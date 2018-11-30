class UserController < ApplicationController

  USERS = {
    1 => {username: "samricotta", password: "sam12323"}
  }

  def new
    @users = USERS
  end

  def create
   new_user
   redirect_to new_path
  end

  def find_last_key
    last = USERS.keys.last
    @id = last += 1
  end

  def new_user
    find_last_key
    @user = {@id => {username: params[:username], password: params[:password]}}
    USERS.merge!(@user)
  end
end

  def validation
    if params[:password] =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
      flash[:notice] = "Password Strong"
      new_user
    elsif params[:password] =~ /^(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/
      flash[:notice] = "Password Medium"
      new_user
    else
      flash[:notice] = "Password Weak"
    end
  end
