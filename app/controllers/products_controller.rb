class ProductsController < ApplicationController
add_breadcrumb "productos y servicios", :products_path

	def index

    @categorias = Category.where(parent_id: nil).order("updated_at ASC")
    @c = Category.all
    @products = Product.joins(:category)
    if params[:category]
      @products = Product.where(:category => params[:category])
    else
      @products = Product.all
    end
	end

	def show
    @categorias = Category.where(parent_id: nil).order("updated_at ASC")
		@producto = Product.friendly.find(params[:id])

		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @product }
	  end
	end


  private

  def product_params
    params.require(:product).permit(:id, :title, :description, :image, :category_id)
  end
end
