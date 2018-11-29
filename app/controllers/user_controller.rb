class UserController < ApplicationController

  USERS = {
    1 => {username: "samricotta", password: "sam12323"}
  }

  def new
    @users = USERS
  end

  def create
   validation
   redirect_to new_path
  end

  def validation
    return flash[:notice] = "Please create a password" if params[:password].blank?
    if params[:password] =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
      flash[:notice] = "Password Strong"
      new_user
    else
      flash[:notice] = "Password Weak"
    end
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
