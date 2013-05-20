class TenantController < ApplicationController


  def index
  	@tenant = current_user
  end

end

