class Author < User
  attr_accessible :author

  

  def self.find_by_id(id)
    User.where(:author => true).where(:id => id).limit(1).first
  end
end