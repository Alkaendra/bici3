class WelcomeController < ApplicationController
  def index
    @sliders = Webimage.all.order("updated_at DESC")
    @categorias = Category.where(parent_id: nil).order("updated_at ASC")
    @comentarios = Post.all.order("updated_at DESC")
    @imagecuotes = Webimage.where(module: 'FRONTFOOTER')
  end
end
