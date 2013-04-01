class Author < User
  attr_accessible :author

  after_initialize :set_author_column

  def self.find_by_id(id)
    User.where(:author => true).where(:id => id).limit(1).first
  end

private
  
  def set_author_column
    self.author = true
  end
end