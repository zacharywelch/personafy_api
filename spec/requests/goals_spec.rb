require 'rails_helper'

describe "Goals" do

  describe "GET /personas/:id/goals" do

    let(:json) { JSON.parse(response.body)["goals"] }

    let(:persona) do
      create :persona, goals: create_list(:goal, 10)
    end

    before do
      get "/personas/#{persona.id}/goals"
    end

    it "returns goals" do
      expect(response).to be_success
      expect(json).to be_an(Array)
      expect(json.length).to be 10
    end
  end

  # it_has_behavior "pagination", "/personas/#{persona.id}/goals", :goal

  describe "GET /goals/:id" do

    let(:json) { JSON.parse(response.body)["goal"] }

    let(:goal) do
      create :goal, description: "Lorem ipsum"
    end

    before do
      get "/goals/#{goal.id}"
    end

    it "returns goal by id" do
      expect(response).to be_success
      expect(json["id"]).to be goal.id
    end

    it "returns goal with description" do
      expect(response).to be_success
      expect(json["description"]).to eq "Lorem ipsum"
    end

    it "returns 404 for goal that doesn't exist" do
      get '/goals/missing'
      expect(response).to be_missing
    end
  end

  describe "POST /personas/:persona_id/goals" do

    let(:json) { JSON.parse(response.body)["goal"] }
    let(:persona) { create :persona }

    before do
      post "/personas/#{persona.id}/goals",
        goal: { description: "Lorem ipsum" }
    end

    it "creates a goal" do
      expect(response).to be_created
      expect(json).to include "id"
      expect(json["description"]).to eq "Lorem ipsum"
    end
  end

  describe "PUT /goals/:id" do

    let(:json) { JSON.parse(response.body)["goal"] }
    let(:goal) { create :goal, description: "Foo" }

    before do
      put "/goals/#{goal.id}",
        goal: { description: "Bar" }
    end

    it "updates a goal" do
      expect(response).to be_success
      expect(json["description"]).to eq "Bar"
    end
  end

  describe "DELETE /goals/:id" do

    let(:goal) { create :goal }

    before do
      delete "/goals/#{goal.id}"
    end

    it "deletes a goal" do
      expect(response).to be_success
      get "/goals/#{goal.id}"
      expect(response).to be_missing
    end
  end
end
