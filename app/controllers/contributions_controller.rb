class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy, :new, :continue_payment]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @contributions = Contribution.all
    respond_with(@contributions)
  end

  def show
    respond_with(@contribution)
  end

  def new
    if user_signed_in?

    end
    @contribution = Contribution.new
    @contribution.build_address(address_type: 'shipping')
    @contribution.user = current_user.id
    @contribution.reward = @reward
    respond_with(@contribution)
  end

  def edit
  end

  def create
    @contribution = Contribution.new(contribution_params)
    #@contribution.save
    respond_with(@contribution)
  end

  def update
    @contribution.update(contribution_params)
    respond_with(@contribution)
  end

  def destroy
    @contribution.destroy
    respond_with(@contribution)
  end

  def continue_payment
    address = params[:contribution][:address]
    person = params[:contribution][:user]
    @contribution = Contribution.new
    @contribution.user = current_user.id
    @contribution.reward = @reward
    @contribution.data = {person: person, shipping: address}
    @contribution.save

    user_session[:contribution] = @contribution
    respond_with(@contribution)
  end

  private
    def set_contribution
      #@contribution = Contribution.find(params[:id])
      @project = Project.find(params[:project_id])
      @reward = @project.rewards.find(params[:reward_id])
    end

    def contribution_params
      params.require(:contribution).permit(:address)
      # params[:contribution]
    end
end
