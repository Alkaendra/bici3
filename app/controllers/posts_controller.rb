class PostsController < ApplicationController
  add_breadcrumb "Colaboraciones", :posts_path

  before_filter :recent_posts
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    add_breadcrumb @post.title, post_path(:id => @post.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def recent_posts
    @recent_posts = Post.order('created_at DESC').limit(5).to_a
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :month, :year,:id)
  end
end
