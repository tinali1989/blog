class Comment < ActiveRecord::Base
  validates_presence_of :commenter,:body
  belongs_to :post
  
  cattr_reader :per_page
  @@per_page = 6
end
