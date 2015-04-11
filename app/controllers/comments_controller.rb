class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :new, :create, :index]
  before_filter :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @project.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @project.comments.new
  end

  # GET /comments/1/edit
  def edit
    @comment = @project.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
 #   if user_signed_in?
      @comment = current_user.comments.new(comment_params)
      firstname = current_user.first_name
      secondname = current_user.second_name
      @comment.username = firstname + ' ' + secondname
      @project.comments << @comment
      respond_to do |format|
        if @project.save
          format.html { redirect_to new_project_comment_path(@project), notice: 'Comment was successfully created.' } # [@project, @comment]
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    # else
    #   redirect_to new_user_session_path
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = @project.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user, :content)
    end
end
