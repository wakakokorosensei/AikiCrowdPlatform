class Update::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    new_params = params.require(:user).permit(:first_name, :second_name, :email, :username, :current_password, :password,
                                              :password_confirmation, :credits, :locale, :twitter, :facebook_link,
                                              :other_link, :uploaded_image, :street,
                                              :phone_number,
                                              :zip_code,
                                              :city,
                                              :state,
                                              :country)
    change_password = true
    if params[:user][:password].blank?
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
      new_params = params.require(:user).permit(:first_name, :second_name, :email, :username,
                                                :credits, :locale, :twitter, :facebook_link,:other_link,
                                                :uploaded_image, :street,
                                                :phone_number,
                                                :zip_code,
                                                :city,
                                                :state,
                                                :country)
      change_password = false
    end

    @user = User.find(current_user.id)
    is_valid = false

    if change_password
      is_valid = @user.update_with_password(new_params)
    else
      is_valid = @user.update_without_password(new_params)
    end

    if is_valid
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      render 'devise/registrations/edit'#redirect_to after_update_path_for(@user)
    else
      render 'devise/registrations/edit'
    end
  end

  # DELETE /resource
  def destroy
    @user = User.find(current_user.id)
    @user.is_active = 0
    if @user.save
      sign_out @user
      redirect_to root_path
    else
      render "edit"
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :email, :username, :current_password, :password,
                                 :password_confirmation, :credits, :locale, :twitter, :facebook_link,
                                 :other_link, :uploaded_image, :street,
                                 :phone_number,
                                 :zip_code,
                                 :city,
                                 :state,
                                 :country)
  end
end
