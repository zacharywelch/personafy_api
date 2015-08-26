require 'rails_helper'

describe "Behaviors" do
let(:json) { JSON.parse(response.body) }
    
  describe "GET /personas/:id/behaviors" do
    
    let(:persona) do
      create :persona, behaviors: create_list(:behavior, 10)
    end

    before do
      get "/personas/#{persona.id}/behaviors"
    end

    it "returns behaviors" do
      expect(response).to be_success
      expect(json).to be_an(Array)
      expect(json.length).to be 10
    end
  end

  # it_has_behavior "pagination", "/personas/#{persona.id}/behaviors", :behavior

  describe "GET /behaviors/:id" do
    
    let(:behavior) do
      create :behavior, description: "Lorem ipsum"
    end
    
    before do
      get "/behaviors/#{behavior.id}"
    end

    it "returns behavior by id" do
      expect(response).to be_success
      expect(json["id"]).to be behavior.id
    end

    it "returns behavior with description" do
      expect(response).to be_success
      expect(json["description"]).to eq "Lorem ipsum"
    end

    it "returns 404 for behavior that doesn't exist" do
      get '/behaviors/missing'
      expect(response).to be_missing
    end
  end

  describe "POST /personas/:persona_id/behaviors" do

    let(:persona) { create :persona }
    
    before do
      post "/personas/#{persona.id}/behaviors", description: "Lorem ipsum"
    end

    it "creates an behavior" do
      expect(response).to be_created
      expect(json).to include "id"
      expect(json["description"]).to eq "Lorem ipsum"
    end
  end

  describe "PUT /behaviors/:id" do
    
    let(:behavior) { create :behavior, description: "Foo" }

    before do
      put "/behaviors/#{behavior.id}", description: "Bar"
    end

    it "updates an behavior" do
      expect(response).to be_success
      expect(json["description"]).to eq "Bar"
    end
  end

  describe "DELETE /behaviors/:id" do
    
    let(:behavior) { create :behavior }
    
    before do
      delete "/behaviors/#{behavior.id}"
    end

    it "deletes an behavior" do
      expect(response).to be_success
      get "/behaviors/#{behavior.id}"
      expect(response).to be_missing
    end
  end
end
