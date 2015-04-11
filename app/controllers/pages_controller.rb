class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy, :index, :new, :create, :viewupdates]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy, :index]

  # GET /pages
  # GET /pages.json
  def index
    @pages = @project.pages.updatepage.to_a
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    find_page
  end

  # GET /pages/new
  def new
    @page = @project.pages.new(content: 'Put your update here')
  end

  # GET /pages/1/edit
  def edit
    find_page
  end


  # POST /pages
  # POST /pages.json
  def create
    save_new_page
    respond_to do |format|
      if @project.save
        format.html { redirect_to [@project, @page], notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    save_page
      #redirect_to edit_project_page_path(@project, 'home')
    respond_to do |format|
      if @project.save
        format.html { redirect_to [@project, @page], notice: 'Page was successfully updated.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def viewupdates
    @pages = @project.pages.updatepage
  end


  def save_page
    @page = find_page
    pageparameter = params[:page]
    @page.content = pageparameter[:content]
    @project.save!
  end

  def save_new_page
    @page = Page.new
    @page.pagetype ='update'
    @page.content = params[:page][:content]
    @project.pages << @page

  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @project = Project.find(params[:project_id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
   params[:page].permit(:content)
  end

  # Busca la pagina o por clave home o por el id, en este ultimo caso se sobrentiende que busca una pagina del tipo updates
  def find_page
    if params[:id] == 'home'
      @page = @project.pages.homepage.to_a.first
    else
      @page = @project.pages.find(params[:id])
    end
  end


end
