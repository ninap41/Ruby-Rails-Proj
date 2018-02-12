class PostsController < ApplicationController
    #logic to interact with DB but we need to use our routes
    #NOT restful routes
    def index
        @posts = Post.all #allows us to pass var from our controller into the view
        @new_post = Post.new
    end

    def create
        @new_post = Post.new(post_params)
        @new_post.save
        redirect_to root_path

    end
    #private methods 
    def post_params
        params.require(:post).permit(:caption)
    end
end
