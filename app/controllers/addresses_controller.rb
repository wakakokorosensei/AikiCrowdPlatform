class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy, :new, :shipping_address, :create]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @addresses = Address.where(user: "#{current_user.id}")
    respond_with(@addresses)
  end

  def show
    respond_with(@address)
  end

  def new
    @address = Address.new
    respond_with(@project,@reward, @address)
  end

  def shipping_address
    @address = Address.new(address_type: 'shipping')
    respond_to do |format|
      format.html { render 'addresses/shipping_address'}
      format.json { head :no_content }
    end
  end


  def edit
  end

  def create
    # if(params[:address].has_key?(:address))
    #   id = params[:address][:address][:id]
    #   if id.empty?
    #     @address = current_user.addresses.new(address_params)
    #     @address.save
    #   else
    #     @address = current_user.addresses.find(id)
    #   end
    # else
    #   @address = current_user.addresses.find(id)
    # end

    @address = current_user.addresses.new(address_params)
    @address.save
    respond_with(@project, @reward, @address)
  end

  def update
    @address.update(address_params)
    respond_with(@address)
  end

  def destroy
    @address.destroy
    respond_with(@address)
  end

  private
    def set_address
      @project = Project.find(params[:project_id])
      @reward = @project.rewards.find(params[:reward_id])
    end

    def find_address
      @address = current_user.addresses.find(id)
    end



    def address_params
      params.require(:address).permit( :street,
                                       :phone_number,
                                       :zip_code,
                                       :city,
                                       :state,
                                       :country,
                                       :address_type)
    end
end
