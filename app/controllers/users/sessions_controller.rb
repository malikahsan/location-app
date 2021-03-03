# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  layout 'login_user'

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    profile_path(id: resource.id)
  end

  # DELETE /resource/sign_out
  def destroy
    super
    new_user_session_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
