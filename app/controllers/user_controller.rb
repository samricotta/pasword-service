class UserController < ApplicationController

  USERS = {
    1 => {username: "samricotta", password: "sam12323"}
  }

  def new
    @users = USERS
  end

  def create
   validation
   # redirect_to new_path
   respond_to do |format|
    format.js
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

  def validation
    if params[:password] =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
      @msg = "Password Strong"
      new_user
    elsif params[:password] =~ /^(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/
      @msg = "Password Medium"
      new_user
    else
      @msg = "Password Weak"
    end
  end
