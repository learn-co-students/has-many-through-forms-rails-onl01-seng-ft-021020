class PostsController < ApplicationController
  def show
    set_post
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  def set_post
    @post = Post.find_by_id(params[:id])
  end

end
