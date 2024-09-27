class PostsController < ApplicationController
    
    def new
      @post = Post.new
    end
  
    def create
        # byebug
      @post = current_user.posts.build(valid_param)
  
      if @post.postname != ""
        @post.save
        redirect_to root_path, notice: 'Post was successfully created.'
      else
        redirect_to root_path, alert: "post not created"
      end
    end
  
    private
  
    def valid_param
      params.require(:post).permit(:postname) 
    end
  end
  