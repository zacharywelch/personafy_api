require 'rails_helper'

describe "Personas API" do

  describe "GET /personas" do

    before do
      Persona.destroy_all
      10.times do
        persona = create(:persona)
        create(:behavior, persona: persona)
        create(:goal, persona: persona)
      end
      get '/personas'
    end

    context "personas" do
      let(:json) { JSON.parse(response.body)["personas"] }

      it "returns personas" do
        expect(response).to be_success
        expect(json).to be_an(Array)
        expect(json.length).to be 10
      end
    end
  end

  #it_has_behavior "pagination", "/personas", :persona

  describe "GET /personas/:id" do
    context "success" do
      let(:persona) do
        create :persona, name: "Foo",
          description: "Lorem ipsum",
          photo_url: "img.jpg"
      end
      let!(:goal) do
        create :goal, description: "Goal",
          persona: persona
      end
      let!(:behavior) do
        create :behavior, description: "Behavior",
          persona: persona
      end

      before do
        get "/personas/#{persona.id}"
      end

      context "persona attributes" do
        let(:json) { JSON.parse(response.body)["persona"] }

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
      end

      context "behaviors" do
        let(:json) { JSON.parse(response.body)["persona"]["behaviors_attributes"] }

        it "returns array of behaviors" do
          expect(response).to be_success
          expect(json).to be_an(Array)
        end

        it "returns related behavior with id" do
          expect(response).to be_success
          expect(json[0]["id"]).to eq behavior.id
        end

        it "returns related behavior with description" do
          expect(response).to be_success
          expect(json[0]["description"]).to eq "Behavior"
        end
      end

      context "goals" do
        let(:json) { JSON.parse(response.body)["persona"]["goals_attributes"] }

        it "returns array of goals" do
          expect(response).to be_success
          expect(json).to be_an(Array)
        end

        it "returns related goals with id" do
          expect(response).to be_success
          expect(json[0]["id"]).to eq goal.id
        end

        it "returns related goals with description" do
          expect(response).to be_success
          expect(json[0]["description"]).to eq "Goal"
        end
      end
    end

    context "missing" do
      it "returns 404 for persona that doesn't exist" do
        get '/personas/missing'
        expect(response).to be_missing
      end
    end
  end

  describe "POST /personas" do

    let(:json) { JSON.parse(response.body)["persona"] }

    before do
      post '/personas',
        persona: {
          name: "Foo",
          description: "Lorem ipsum",
          photo_url: "img.jpg",
          behaviors_attributes: [
            { description: "Behavior 1" },
            { description: "Behavior 2" }
          ],
          goals_attributes: [
            { description: "Goal 1" },
            { description: "Goal 2" }
          ]
        }
    end

    it "creates a persona" do
      expect(response).to be_created
      expect(json).to include "id"
      expect(json["name"]).to eq "Foo"
      expect(json["description"]).to eq "Lorem ipsum"
      expect(json["photo_url"]).to eq "img.jpg"
      expect(json["behaviors_attributes"].length).to be 2
      expect(json["goals_attributes"].length).to be 2
    end
  end

  describe "PUT /personas/:id" do
    let(:persona) do
      create :persona, name: "Foo",
        description: "Lorem ipsum",
        photo_url: "img.jpg"
    end
    let!(:goal) do
      create :goal, description: "Goal 1",
        persona: persona
    end
    let!(:behavior) do
      create :behavior, description: "Behavior 1",
        persona: persona
    end

    before do
      put "/personas/#{persona.id}", params
    end

    context "persona" do
      let(:json) { JSON.parse(response.body)["persona"] }

      let(:params) do
        { persona: { name: "Bar" } }
      end

      it "updates a persona" do
        expect(response).to be_success
        expect(json["name"]).to eq "Bar"
      end
    end

    context "goals" do
      let(:json) { JSON.parse(response.body)["persona"]["goals_attributes"] }

      context "update" do
        let(:params) do
          {
            persona: {
              goals_attributes: [ { id: goal.id, description: "Edited" } ]
            }
          }
        end

        it "updates existing goals" do
          expect(response).to be_success
          expect(json[0]["description"]).to eq "Edited"
        end
      end

      context "create" do
        let(:params) do
          {
            persona: {
              goals_attributes: [ { description: "New" } ]
            }
          }
        end

        it "creates new goals" do
          expect(response).to be_success
          expect(json.length).to eq 2
        end
      end

      context "destroy" do
        let(:params) do
          {
            persona: {
              goals_attributes: [ { id: goal.id, _destroy: '1' } ]
            }
          }
        end

        it "destroys goals" do
          expect(response).to be_success
          expect(json).to be_empty
        end
      end
    end

    context "behaviors" do
      let(:json) { JSON.parse(response.body)["persona"]["behaviors_attributes"] }

      context "update" do
        let(:params) do
          {
            persona: {
              behaviors_attributes: [ { id: behavior.id, description: "Edited" } ]
            }
          }
        end

        it "updates existing behaviors" do
          expect(response).to be_success
          expect(json[0]["description"]).to eq "Edited"
        end
      end

      context "create" do
        let(:params) do
          {
            persona: {
              behaviors_attributes: [ { description: "New" } ]
            }
          }
        end

        it "creates new behaviors" do
          expect(response).to be_success
          expect(json.length).to eq 2
        end
      end

      context "destroy" do
        let(:params) do
          {
            persona: {
              behaviors_attributes: [ { id: behavior.id, _destroy: '1' } ]
            }
          }
        end

        it "destroys behaviors" do
          expect(response).to be_success
          expect(json).to be_empty
        end
      end
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
