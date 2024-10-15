
    
    class LikesController < ApplicationController
        def create
            
           
          post = Post.find(params[:post_id])
          like_exists = Like.exists?(user_id: current_user,post_id: post.id)
         
          @like = post.likes.build(user_id: current_user.id)  
      
          if like_exists == false 
            @like.save
            redirect_to post, notice: 'Like was successfully created.'
          else
            # Find the specific like object for the current user
            like = post.likes.find_by(user_id: current_user.id)
          
            if like
              like.destroy  # Destroy the found like
              redirect_to post, notice: 'You unliked this post.'
            else
              redirect_to post, alert: 'You have not liked this post yet.'
            end
          end
        end
    end
      
      

