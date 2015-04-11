class DesktopController < ApplicationController
=begin
  Este controller se encarga de lo que se refiere a la
  visualizacion generica de la plataforma
=end

  # Busca todos los proyectos presentes en la plataforma
  def index
    @project = Project.all
  end

  def show
    set_from_projectid
    mcriteria = @project.pages.homepage.to_a
    @page = mcriteria.first
  end

  private

  def set_from_projectid
    @project = Project.find(params[:project_id])
  end

end


