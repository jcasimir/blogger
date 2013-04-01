class User < ActiveRecord::Base
  attr_accessible :password, :username, :first_name

  before_save :hash_password_if_changed

  def to_s
    first_name || username
  end

  def hash_password_if_changed
    if password_changed?
      self.password = hash_password(self.password)
    end
  end

  def password_matches?(input)
    BCrypt::Password.new(password) == input
  end

  def hash_password(input)
    BCrypt::Password.create(input)
  end
end
