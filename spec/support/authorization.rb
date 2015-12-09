require 'rails_helper'

shared_context :authorization do  
  let(:auth_token) do 
    { 'Authorization' => "Bearer #{create(:access_token).token}" }
  end
end
