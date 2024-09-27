
    
    class LikesController < ApplicationController
        def create
            
           
          post = Post.find(params[:post_id])
          like_exists = Like.exists?(user_id: current_user,post_id: post.id)
         
          @like = post.likes.build(user_id: current_user.id)  
      
          if like_exists == false 
            @like.save
            redirect_to post, notice: 'Like was successfully created.'
          else
            redirect_to post, alert: 'you already liked this post.'
          end
        end
      end
      
      

