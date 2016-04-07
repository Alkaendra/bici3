class SuperAdmin::CategoriesController < SuperAdminController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to ([:super_admin, @category]), notice: 'Categoria creada correctamente.' }
        format.json { render action: 'show', status: :created, category: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @category = Category.friendly.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @category }
    end
  end

  def update

        respond_to do |format|
    	      if @category.update_attributes(category_params)
    	        format.html { redirect_to ([:super_admin, @category]), notice: 'Categoria actualizada correctamente.' }
    	        format.json { head :no_content }
    	      else
    	        format.html { render action: "edit" }
    	        format.json { render json: @category.errors, status: :unprocessable_entity }
    	      end
    	    end
  end

  def destroy

    @category.destroy
    respond_to do |format|

      format.html { redirect_to ([:super_admin, @category]), :notice => "Categoria eliminada correctamente." }
      format.js {list_refresh}
    end
  end

  private

      # Never trust parameters from the scary internet, only allow the white list through.
      def category_params
        params.require(:category).permit(
          :parent_id,
          :title,
          :description,
          :meta_description,
          :featured,
          :image,
          :images_attributes => [:id, :photo, :headline, :caption, :done, :_destroy]
        )
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end
end
