require 'rails_helper'

describe "Personas API" do
  
  describe "GET /personas" do
    
    let(:json) { JSON.parse(response.body)["personas"] }

    before do
      create_list :persona, 10
      get '/personas'
    end

    it "returns personas" do
      expect(response).to be_success
      expect(json).to be_an(Array)
      expect(json.length).to be 10
    end
  end

  it_has_behavior "pagination", "/personas", :persona

  describe "GET /personas/:id" do
    
    let(:json) { JSON.parse(response.body)["persona"] }
    
    let(:persona) do
      create :persona, name: "Foo", 
                       description: "Lorem ipsum", 
                       photo_url: "img.jpg"
    end
    
    before do
      get "/personas/#{persona.id}"
    end

    it "returns persona by id" do
      expect(response).to be_success
      expect(json["id"]).to be persona.id
    end

    it "returns persona with name" do
      expect(response).to be_success
      expect(json["name"]).to eq "Foo"
    end

    it "returns persona with description" do
      expect(response).to be_success
      expect(json["description"]).to eq "Lorem ipsum"
    end

    it "returns persona with photo_url" do
      expect(response).to be_success
      expect(json["photo_url"]).to eq "img.jpg"
    end

    it "returns 404 for persona that doesn't exist" do
      get '/personas/missing'
      expect(response).to be_missing
    end
  end

  describe "POST /personas" do
    
    let(:json) { JSON.parse(response.body)["persona"] }
    
    before do
      post '/personas', 
        persona: { 
          name: "Foo", 
          description: "Lorem ipsum", 
          photo_url: "img.jpg" 
        }
    end

    it "creates an persona" do
      expect(response).to be_created
      expect(json).to include "id"
      expect(json["name"]).to eq "Foo"
      expect(json["description"]).to eq "Lorem ipsum"
      expect(json["photo_url"]).to eq "img.jpg"
    end
  end

  describe "PUT /personas/:id" do
    
    let(:json) { JSON.parse(response.body)["persona"] }    
    let(:persona) { create :persona, name: "Foo" }

    before do
      put "/personas/#{persona.id}", 
        persona: { name: "Bar" }
    end

    it "updates an persona" do
      expect(response).to be_success
      expect(json["name"]).to eq "Bar"
    end
  end

  describe "DELETE /personas/:id" do
    
    let(:json) { JSON.parse(response.body)["persona"] }
    let(:persona) { create :persona }
    
    before do
      delete "/personas/#{persona.id}"
    end

    it "deletes an persona" do
      expect(response).to be_success
      get "/personas/#{persona.id}"
      expect(response).to be_missing
    end
  end
end
