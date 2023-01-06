class CommentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

# before_action :find_comment, only [:destroy, :edit, :update]

def index 
    @comments= Comment.all
    render json: @comments
end

def show
    render json: @comment
end

def create
    comment=Comment.create!(comments_params)
    render json: comment ,status: ,:created
end



def destroy
    find_comment.destroy

end
def update
    comment = find_comment
    comment.update!(comments_params)
    render json: comment, status: :ok
end

private

def comments_params
    params.permit(:body ,:user_id,:answer_id)
end

def render_unproccessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
end

def find_comment
    @comment = Comment.find(params[:id])
end


end
