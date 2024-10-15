class PostsController < ApplicationController
    def index
     
      @posts = current_user.posts
    end

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
  
    def destroy
      @post = Post.find_by(id: params[:id], user_id: params[:user_id].to_i)
    
      if @post && @post.destroy
        redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted.'
      else
        redirect_to user_posts_path(current_user), alert: 'Post not found or could not be deleted.'
      end
    end
    
    private
  
    def valid_param
      params.require(:post).permit(:postname,:profile_picture) 
    end
  end
  