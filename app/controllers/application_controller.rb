class ApplicationController < ActionController::Base

 protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :get_employee
  
 protected
 def configure_permitted_parameters
 	devise_parameter_sanitizer.permit(:sign_in, keys: [:employee_id])
 end

 def after_sign_in_path_for(resource)
 	 current_user_employer_id = EmployeeDetail.where(:user_id => current_user.id)
 end

 def get_employee
 	 @current_user_employer_id = EmployeeDetail.where("user_id" => current_user.id).select( "id").first 	 
 end
end
