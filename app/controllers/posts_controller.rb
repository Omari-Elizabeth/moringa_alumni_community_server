class PostsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response

    
    # GET /posts
    # GET /posts.json
    def index
      posts = Post.all
      render json: posts
    end
  
    
    def show
      post = Post.find(params[:id])
      render json: post
    end
  
    # GET /posts/new
    def new
      post = Post.new
      post.user_id = current_user.id
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts
    # POST /posts.json
    def create
      post = Post.new(post_params)
      post.save
      redirect_to post
    end
  
    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update

      post = find_params
      post.update!(post_params)
      render json: post, status: :ok

    end
  
    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      post = Post.find(params[:id]) 
      post.destroy
      render json: post
    end
    

  
    private
      def find_params
        post = Post.find(params[:id])
      end


    def render_unproccessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
      end
  
      def post_params
        params.require(:post).permit(:user_id, :body)

      end
  end
