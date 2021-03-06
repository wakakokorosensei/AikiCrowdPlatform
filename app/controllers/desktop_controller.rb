=begin
  Este controller se encarga de lo que se refiere a la
  visualizacion generica de la plataforma
=end
class DesktopController < ApplicationController

  before_filter :authenticate_user!,  only: []

  # Busca todos los proyectos presentes en la plataforma
  def index
    @project = Project.all
  end

  def show_home_page
    set_from_projectid
    mcriteria = @project.pages.homepage.to_a
    @page = mcriteria.first
    @project
  end

  def show_updates_page
    set_from_projectid
    @page = @project.pages.updatepage.to_a

  end

  def show_comments_project

  end

  # Esta action sirve para visualizar la lista de los comentarios y para poder isertar un comentario desde esa pagina
  def backer_comment
    @comment = @project.comments.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show_rewards_project

  end

  private

  def set_from_projectid
    @project = Project.find(params[:project_id])
  end

end


