class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :new, :show]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /posts
  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  # GET /posts/1
  def show
    @comments = @post.comments.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end
    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:file, :name, :content, :user_id, :category_id)
    end
end
