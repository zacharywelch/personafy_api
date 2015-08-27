json.persona do
  json.extract! @persona, :id, :name, :description, :photo_url, :created_at, :updated_at
  json.behavior_ids @persona.behaviors.map(&:id)
  json.goal_ids @persona.goals.map(&:id)
end

json.behaviors @persona.behaviors do |behavior|
  json.extract! behavior, :id, :description
end

json.goals @persona.goals do |goal|
  json.extract! goal, :id, :description
end
