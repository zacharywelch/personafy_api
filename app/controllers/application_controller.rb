class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  before_action :doorkeeper_authorize!
  helper_method :current_resource_owner

  self.responder = ApplicationResponder
  respond_to :json

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
