class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to :controller=>"posts", :action => "show",:id=>@comment.post_id
    end
  end
end
