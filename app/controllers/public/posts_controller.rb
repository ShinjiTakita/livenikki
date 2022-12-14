class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(4)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
  @posts = Post.search(params[:keyword]).page(params[:page]).per(4)
  @keyword = params[:keyword]
  render "index"
  end

  private
    def post_params
      params.require(:post).permit(:tag_id, :customer_id, :comment_id, :title, :body, :setlist, :venue, images: [])
    end
end
