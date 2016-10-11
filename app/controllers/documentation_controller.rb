class DocumentationController < ApplicationController
  def index
    redirect_to controller: :documentation, action: :api_v1
  end

  def api_v1
    @applications = Doorkeeper::Application.all
    render layout: false
  end

  def o2c
    render layout: false
  end

  def authorize
    @access_code = params[:code]
    @access_grant = Doorkeeper::AccessGrant.where(resource_owner_id: current_user.id, token: @access_code).last
    @application = @access_grant.application if @access_grant.present?
  end
end
