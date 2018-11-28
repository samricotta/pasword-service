class User < ApplicationRecord

  def initialize(users)
    @users = Hash.new(0)
  end


end
