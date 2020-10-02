class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, except: [:change_language], unless: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def after_sign_out_path_for(resource_or_scope)
            '/users/sign_in'
        end

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password, :is_admin) }
            devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
        end
end
