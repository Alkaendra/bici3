
class SuperAdmin::PostsController < SuperAdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to ([:super_admin, @post]), notice: 'Post fue correctamente creado.' }
        format.json { render action: 'show', status: :created, post: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @post }
	  end
  end

  def update

    respond_to do |format|
	      if @post.update_attributes(post_params)
	        format.html { redirect_to ([:super_admin, @post]), notice: 'Post actualizado correctamente.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
	    end
  end

  def destroy
    @post.destroy
    respond_to do |format|

      format.html { redirect_to ([:super_admin, @post]), :notice => "Post eliminado correctamente." }
      format.js {list_refresh}
    end
  end

  private

      # def list_refresh
      #   if params[:show_posts] == 'true'
      #     @posts = Post.where(:page_id => params[:id]).paginate(:page => params[:page], :per_page => 20).order('position ASC')
      #     return render(:file => 'admin/posts/show_list_refresh.js.erb')
      #   else
      #     @pages = Page.paginate(:page => params[:page], :per_page => 10).order('name ASC')
      #     return render(:file => 'admin/posts/list_refresh.js.erb')
      #   end
      # end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(
          :title,
          :body,
          :published,
          :meta_description,
          :image,
          :images_attributes => [:id, :photo, :headline, :caption, :done, :_destroy]
        )
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

end
