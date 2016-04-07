class SuperAdmin::WebimagesController < SuperAdminController
  before_action :set_webimage, only: [:show, :edit, :update, :destroy]

  def index
    @webimages = Webimage.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @webimages }
    end
  end

  def new
    @webimage = Webimage.new
  end

  def edit
  end

  def create
    @webimage = Webimage.new(webimage_params)
    #@category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @webimage.save
        format.html { redirect_to ([:super_admin, @webimage]), notice: 'Imagen creada correctamente.' }
        format.json { render action: 'show', status: :created, product: @webimage }
      else
        format.html { render action: 'new' }
        format.json { render json: @webimage.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def update

    respond_to do |format|
        if @webimage.update_attributes(webimage_params)
          format.html { redirect_to ([:super_admin, @webimage]), notice: 'Imagen actualizada correctamente.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @webimage.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @webimage.destroy
    respond_to do |format|

      format.html { redirect_to ([:super_admin, @webimage]), :notice => "Imagen eliminada correctamente." }
      format.js {list_refresh}
    end
  end


  def options_for_modules
    [
      ['First Option','first_option'],
      ['Second Option','second_option']
    ]
  end
  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def webimage_params
    params.require(:webimage).permit(
      :title,
      :module,
      :image,
      :images_attributes => [:id, :photo, :headline, :caption, :done, :_destroy]
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_webimage
    @webimage = Webimage.find(params[:id])
  end


end
