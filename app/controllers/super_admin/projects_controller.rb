class SuperAdmin::ProjectsController < SuperAdminController
  before_action :set_project, only: [:edit, :update, :destroy]
  def index
    @projects = Project.joins(:product)
    #@products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    #@category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @project.save
        format.html { redirect_to ([:super_admin, @project]), notice: 'Proyecto creado correctamente.' }
        format.json { render action: 'show', status: :created, product: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @project = Project.friendly.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @project }
    end
  end

  def update

    respond_to do |format|
        if @project.update_attributes(project_params)
          format.html { redirect_to ([:super_admin, @project]), notice: 'Producto actualizado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @project.destroy
    respond_to do |format|

      format.html { redirect_to ([:super_admin, @project]), :notice => "Productos eliminado correctamente." }
      format.js {list_refresh}
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :meta_description,
      :featured,
      :image,
      :place,
      :category_id,
      :product_id,
      :project_type_id,
      :images_attributes => [:id, :photo, :headline, :caption, :done, :_destroy]
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end
end
