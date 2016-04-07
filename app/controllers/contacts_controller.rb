class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @categorias = Category.where(parent_id: nil).order("updated_at ASC")
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por contactar con nosotros. En la mayor brevedad contactaremos contigo'
    else
      flash.now[:error] = 'Mensaje no enviado'
      render :new
    end
  end
end
