class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy, :index, :new, :create, :reward_selected]

  # GET /rewards
  # GET /rewards.json
  def index
    @project.rewards
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    @reward = find_reward
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :show, status: :created, location: @reward }
    end
  end

  # GET /rewards/new
  def new
    @reward = @project.rewards.new
  end

  # GET /rewards/1/edit
  def edit
    @reward = find_reward
  end

  # POST /rewards
  # POST /rewards.json
  def create
    @project.rewards.create!(reward_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to [@project, @reward], notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1
  # PATCH/PUT /rewards/1.json
  def update
    respond_to do |format|
     @reward = find_reward
      if @reward.update(reward_params)
        format.html { redirect_to [@project, @reward], notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  def reward_selected
    @reward = find_reward
    respond_to do |format|
      format.html { render 'rewards/reward_selected'}
      format.json { head :no_content }
    end
  end


  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to rewards_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

=begin *****************************************************************************************
  ESTA ES LA ZONA PRIVADA
  DE AQUI EN ADELANTE NADIE PUEDE ESCRIBIR NADA PUBLICO
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_params
      params.require(:reward).permit(:name, :price, :maximum_backers, :description)
    end

    def find_reward
      @project.rewards.find(params[:id])
    end


end
