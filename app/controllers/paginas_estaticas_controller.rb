class PaginasEstaticasController < ApplicationController
  def contacto
  	@categorias = Category.where(parent_id: nil).order("updated_at ASC")
  end

  def sobreNosotros
  end
end
