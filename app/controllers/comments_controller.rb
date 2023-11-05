class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        # debugger
        @post = Post.find_by_id(params[:post_id])
        @comment = @post.comments.new(content: params[:content], post_id: params[:post_id], user_id: @post.user_id)
    
        if !@comment.save
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end
    
        redirect_to post_path(params[:post_id])
    end

    private

        # Only allow a list of trusted parameters through.
        def comment_params
        #params.require(:post).permit(:content, :user_id)
        params.require(:comment).permit(:content).merge(post_id: params[:post_id])
        end
end
