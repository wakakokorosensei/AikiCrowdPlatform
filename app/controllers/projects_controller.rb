class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :index]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(user: "#{current_user.id}")
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @page = @project.pages.homepage.to_a.first
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    set_category
   # set_project_type
    respond_to do |format|
      if @project.save
        @project.pages.create(pagetype: 'home', content: 'Put your content here')
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    set_category
   # set_project_type
    @project.update(project_params)
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

  def set_from_projectid
    @project = Project.find(params[:project_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:id, :name, :description, :short_image, :image_url, :story, :goal, :kia, :aol,
                                    :category, categories_attributes: [:id, :name], pages_attributes: [:id, :pagetype, :content],
                                    rewards_attributes: [:name, :price, :maximum_backers, :description])
  end


  def set_category
    category = Category.find(params[:project][:categories][:id])
    category.projects << @project
  end

  # def set_project_type
  #   prjType = ProjectType.find(params[:project][:project_types][:id])
  #   prjType.projects << @project
  # end


end