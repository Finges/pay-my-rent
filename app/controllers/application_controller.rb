class ApplicationController < ActionController::Base
  protect_from_forgery

	private
	  def authorize_admin!
	  	authenticate_user!
	  	unless current_user.admin? || current_user.type == "Landlord"
	  		flash[:alert] = "You must be an admin or landlord to do that."
	  		redirect_to root_path
	  	end
	  end

	  def after_sign_in_path_for(resource)
	  	if current_user.type == "Landlord"
	  		landlord_index_url
	  	elsif current_user.type == "Tenant"
	  		tenant_index_url
	  	else
	  		root_path
	  	end
	  end
end
