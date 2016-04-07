class CategoriesController < ApplicationController
	def index
		@categorias = Category.where(parent_id: nil)
		if params[:category]
			if params[:parent]
				@categor = Category.where(:parent_id => params[:category]).order("id ASC")
			else
      			@categor = Category.where(:id=> params[:category])
      		end
	    else
	        @categor = Category.where(parent_id: nil).order("id ASC")
	    end		
	end
end
