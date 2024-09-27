class HomesController < ApplicationController
    before_action :check_Authentication
    def index
        @posts = Post.all
    end 
    private 
    def check_Authentication
        if !authenticate_user!
            redirect_to "new_user_session"
       end
    end
end
