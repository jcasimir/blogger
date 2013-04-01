class User < ActiveRecord::Base
  attr_accessible :password, :username, :first_name

  def to_s
    first_name || username
  end
end
