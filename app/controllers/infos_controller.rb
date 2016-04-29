class InfosController < ApplicationController
  def new
    @info = Info.new
    @categorias = Category.where(parent_id: nil).order("updated_at ASC")
    @c = Category.find(params[:c_id])
    @prd = Product.find(params[:p_id])
  end

  def create
    @categorias = Category.where(parent_id: nil).order("updated_at ASC")
    @info = Info.new(info_params)
    @info.request = request
    if @info.deliver
      flash.now[:notice] = 'La información ha llegado correctamente. Te responderemos con la mayor brevedad posible.'
    else
      flash.now[:error] = 'Mensaje no enviado'
      render :new
    end
  end
  private

      # Never trust parameters from the scary internet, only allow the white list through.
      def info_params
        params.require(:info).permit(
          :id,
          :nombre,
          :email,
          :tema,
          :mensaje
        )
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_info
        @info = Info.find(params[:id])
      end
end
