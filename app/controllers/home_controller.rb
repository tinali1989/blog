class HomeController < ApplicationController

  before_filter :authorize, :except => [:login,:index,:signOut]
  
  def index
    @user = User.new
  end
  
  def signOut
    session[:username] = nil
    session[:role]= nil
    redirect_to :action=>'index'
  end

  def login
    @user = User.new(params[:user])
    @userNew = User.find_by_username_and_password(@user.username,@user.password)
    if(nil == @userNew)
       flash[:warning] = "username or password is incorrect"
       render :action=>'index'
    else
       session[:username] = @userNew.username
       session[:role]=@userNew.role
    
       redirect_to(:controller=>"posts",:action=>"index")
    end
  end
end
