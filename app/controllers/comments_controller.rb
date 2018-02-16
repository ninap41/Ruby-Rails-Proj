class CommentsController < ApplicationController
    def create 
        @post = Post.find(params[:post_id]) #comment_params
        @post.comments.reject(&:new_record?)
        # @comment = @post.comments.create(params[:comment].permit(:name, :content, :body))
        @new_comment = @post.comments.create(comment_params)
        flash[:success] = "Comment Created!"
        redirect_to post_path(@post)
    end

    def comment_params
        params.require(:comment).permit(:name, :content) 
    end
    
    def show 
        @comment = Comment.find(params[:id])
        @comments = @post.comments
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.delete
        flash[:success] = 'Thanks for deleting that comment'

        respond_to do |format|
          format.html { redirect_to post_path(@post)}
          format.xml  { head :ok }
        

        end
    end


end
