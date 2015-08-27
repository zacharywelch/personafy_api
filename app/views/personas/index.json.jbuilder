json.personas do
  json.array!(@personas) do |persona|
    json.extract! persona, :id, :name, :description, :photo_url
    json.behavior_ids persona.behaviors.map(&:id)
    json.goal_ids persona.goals.map(&:id)
    json.url persona_url(persona, format: :json)
  end
end

json.behaviors @personas.map(&:behaviors).flatten do |behavior|
  json.extract! behavior, :id, :description
end

json.goals @personas.map(&:goals).flatten do |goal|
  json.extract! goal, :id, :description
end
