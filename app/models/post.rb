class Post < ActiveRecord::Base
  #not null validation
  validates_presence_of :name,:title
  has_many :comments
  
  validates_length_of :title,:within=>6..15
  
  def before_create
    puts("before create a new post")
    return true;
  end
  
  #pagination
  cattr_reader :per_page
  @@per_page = 5
end
