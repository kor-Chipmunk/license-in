class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super

    # 목표, 관심, 획득 컨테이너 생성
    # logger.debug "params[:email] : #{params[:user][:email]}"
    registrated_user = User.find_by_email(params[:user][:email])
    # logger.debug "registrated_user id = #{registrated_user.id}"
    
    aimlicensecontainer = AimLicenseContainer.new
    aimlicensecontainer.user = registrated_user
    if aimlicensecontainer.save
      # logger.debug "AimlicenseContainer 저장 성공!"
    end
    
    likelicensecontainer = LikeLicenseContainer.new
    likelicensecontainer.user = registrated_user
    if likelicensecontainer.save
      # logger.debug "LikeLicenseContainer 저장 성공!"
    end
    
    gotlicensecontainer = GotLicenseContainer.new
    gotlicensecontainer.user = registrated_user
    if gotlicensecontainer.save
      # logger.debug "GotLicenseContainer 저장 성공!"
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
