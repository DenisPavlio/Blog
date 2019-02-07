class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[index new show]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def show
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def post_params
    params.require(:post).permit(:file, :name, :content, :user_id, :category_id)
  end
end
