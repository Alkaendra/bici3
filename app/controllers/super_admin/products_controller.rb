class SuperAdmin::ProductsController < SuperAdminController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    # looks like that join is just a sql query! easy! Too bad the relationships don't get diagrammed in activerecord. **There is a gem that generates a read-only erd.
    # @products = Product.joins('LEFT JOIN subcategories ON products.category_id = subcategories.id')
    # HERE is the rails way to do the join. Could it be any easier?
    @products = Product.joins(:category)
    #@products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def new
    @product = Product.new
    #@category = category.find(params[:product_id])
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to ([:super_admin, @product]), notice: 'Producto creado correctamente.' }
        format.json { render action: 'show', status: :created, product: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @product }
    end
  end

  def update

    respond_to do |format|
        if @product.update_attributes(product_params)
          format.html { redirect_to ([:super_admin, @product]), notice: 'Producto actualizado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @product.destroy
    respond_to do |format|

      format.html { redirect_to ([:super_admin, @product]), :notice => "Productos eliminado correctamente." }
      format.js {list_refresh}
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(
      :title,
      :description,
      :meta_description,
      :featured,
      :image,
      :category_id,
      :precio,
      :images_attributes => [:id, :photo, :headline, :caption, :done, :_destroy]
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
