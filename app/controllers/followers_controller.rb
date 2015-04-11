class FollowersController < ApplicationController
  before_action :set_follower, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @followers = Follower.all
    respond_with(@followers)
  end

  def show
    respond_with(@follower)
  end

  def new
    @follower = Follower.new
    respond_with(@follower)
  end

  def edit
  end

  def create
    @follower = Follower.new(follower_params)
    @follower.save
    respond_with(@follower)
  end

  def update
    @follower.update(follower_params)
    respond_with(@follower)
  end

  def destroy
    @follower.destroy
    respond_with(@follower)
  end

  private
    def set_follower
      @follower = Follower.find(params[:id])
    end

    def follower_params
      params[:follower]
    end
end
