class CommentsController < ApplicationController
    def new
        
        @post = Post.find(params[:post_id])
        @all_comments = Comment.all.where(post_id:@post.id)
       @comment = Comment.new
    end
    
    def create
        post = Post.find(params[:post_id])
        @comment = post.comments.build(valid_param)  # Use build instead of create! for better error handling
      
        if @comment.body !=""
            @comment.save
          redirect_to root_path, notice: 'Comment was successfully created.'  # Redirect to the post show page or another page
        else  
            redirect_to root_path, notice: 'Comment not  created.' 
        end
      end
      
      private
      
      def valid_param
        params.require(:comment).permit(:body, :user_id)
      end
      
end
