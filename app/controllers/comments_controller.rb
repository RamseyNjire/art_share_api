class CommentsController < ApplicationController
    def index
        if params.has_key?(:user_id)
            comments = Comment.where(commenter_id: params[:user_id])
        elsif params.has_key?(:artwork_id)
            comments = Comment.where(artwork_id: params[:artwork_id])
        end

        render json: comments
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end


    def like
        like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Comment')
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def unlike
        like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Comment')
        if like.destroy
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:artwork_id, :commenter_id, :body)
    end
end
