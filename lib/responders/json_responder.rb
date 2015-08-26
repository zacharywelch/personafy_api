require 'responders'

module Responders
  module JsonResponder
    def api_behavior
      if post?
        render :show, status: :created, location: api_location
      elsif put?
        render :show, status: :ok, location: api_location
      else
        super
      end    
    end

    def json_resource_errors
      resource.errors
    end
  end
end
