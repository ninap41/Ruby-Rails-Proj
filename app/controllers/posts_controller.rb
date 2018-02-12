class PostsController < ApplicationController
    #logic to interact with DB but we need to use our routes
    #NOT restful routes
    def index
        @posts = Post.all.sort { |p1, p2| p2.created_at <=> p1.created_at }#allows us to pass var from our controller into the view
        @new_post = Post.new
        error = ""
    end

    def create
        @new_post = Post.new(post_params)
        if  @new_post.name == ""
            @new_post.name = "Anonymous"
        end
        if @new_post.image == ""
            @new_post.image == "https://img.etsystatic.com/il/109785/715992951/il_fullxfull.715992951_3wie.jpg"
        end
        if  @new_post.thought == ""
            redirect_to root_path
        end
        @new_post.save
        redirect_to root_path
        
    end
    #private methods 
    def post_params
        params.require(:post).permit(:thought,:name,:image)
        
    end
end
