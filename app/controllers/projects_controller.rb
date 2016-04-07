class ProjectsController < ApplicationController
  def index

    @project_types = ProjectType.all
    @projects = Project.joins(:project_type)
    if params[:project_type]
      @projects = Project.where(:project_type => params[:project_type])
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @project }
    end
  end


  private

  def project_params
    params.require(:project).permit(:title, :description, :image, :project_type_id)
  end
end
