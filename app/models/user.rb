class User

  def initialize
    @id = 0
  end

  def find_last_key
    last = USERS.keys.last
    @id = last += 1
  end

  def create_user
    find_last_key
    user = {@id => {username: params[:username], password: params[:password]}}
  end
end
