json.personas do
  json.array!(@personas) do |persona|
    json.extract! persona, :id, :name, :role, :description, :avatar, :color
    json.url persona_url(persona, format: :json)

    json.behaviors_attributes persona.behaviors do |behavior|
      json.extract! behavior, :id, :description
    end

    json.goals_attributes persona.goals do |goal|
      json.extract! goal, :id, :description
    end
  end
end
