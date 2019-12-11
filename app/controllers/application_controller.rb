class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	def authenticate
		redirect_to new_user_registration_path unless user_signed_in?
	end 

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
