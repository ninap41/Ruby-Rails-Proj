class PostsController < ApplicationController
    #logic to interact with DB but we need to use our routes
    #NOT restful routes
    def index
        @posts = Post.all.sort { |p1, p2| p2.created_at <=> p1.created_at }#allows us to pass var from our controller into the view
        @new_post = Post.new
        error = ""
    end

    def show 
        @post = Post.find(params[:id])
        # @post.comments.reject(&:new_record?)
        @comments = @post.comments
    end

    def create
        @new_post = Post.new(post_params)
        if  @new_post.name == ""
            @new_post.name = "Anonymous"
            flash[:noname] 
        end
        if @new_post.image == ""
            flash[:success] = 'You created a post without an image... We have a default for you though!'

            @new_post.image = "https://img.etsystatic.com/il/109785/715992951/il_fullxfull.715992951_3wie.jpg"
        end
        if  @new_post.thought == ""
            redirect_to root_path
        end
        @new_post.save
        redirect_to root_path
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            if  @post.name == ""
                @post.name = "Anonymous"
                flash[:noname] 
            end
            if @post.image == ""
                flash[:success] = 'You created a post without an image... We have a default for you though!'
                @post.image = "https://img.etsystatic.com/il/109785/715992951/il_fullxfull.715992951_3wie.jpg"
            end
            if  @post.thought == ""
                flash[:noname] = "You submitted an empty post! We filled in the gaps for you."
            end
            flash[:success] = 'Thanks for updating the post!'
            redirect_to root_path 
        else
            render "edit"
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = 'Thanks for deleting that post'
        redirect_to root_path
    end

    #private methods 
    def post_params
        params.require(:post).permit(:thought,:name,:image)
        
    end
end
