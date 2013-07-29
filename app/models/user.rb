class User < ActiveRecord::Base
  validates_uniqueness_of :username,:case_sensitive=>true
  validates_confirmation_of :password,:message=>'confirmation password and password are not equal'
  
  #to ensure the admin cannot be deleted unintentionally
  before_destroy :dont_destroy_admin
  def dont_destroy_admin
    raise "Can't destroy admin" if self.username == 'admin'
  end
end
