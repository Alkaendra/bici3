class SuperAdmin::ProjectTypesController < SuperAdminController
  before_action :set_project_type, only: [:edit, :update, :destroy]
  def index
    @project_types = ProjectType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_types }
    end
  end

  def new
    @project_type = ProjectType.new
  end

  def edit
  end

  def create
    @project_type = ProjectType.new(project_type_params)
    #@category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @project_type.save
        format.html { redirect_to ([:super_admin, @project_type]), notice: 'Tipo de Proyecto creado correctamente.' }
        format.json { render action: 'show', status: :created, product: @project_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @project_type = ProjectType.friendly.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @Project_type }
    end
  end

  def update

    respond_to do |format|
        if @project_type.update_attributes(project_type_params)
          format.html { redirect_to ([:super_admin, @project_type]), notice: 'Tipo de Proyecto actualizado correctamente.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @project_type.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @project_type.destroy
    respond_to do |format|

      format.html { redirect_to ([:super_admin, @project_type]), :notice => "Tipo de Proyecto eliminado correctamente." }
      format.js {list_refresh}
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def project_type_params
    params.require(:project_type).permit(
      :title,
      :description,

    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project_type
    @project_type = ProjectType.find(params[:id])
  end
end
