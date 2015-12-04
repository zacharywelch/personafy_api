json.persona do
  json.extract! @persona, :id, :name, :description, :avatar, :color, :created_at, :updated_at
  json.created_by @persona.user.name

  json.behaviors_attributes @persona.behaviors do |behavior|
    json.extract! behavior, :id, :description
  end

  json.goals_attributes @persona.goals do |goal|
    json.extract! goal, :id, :description
  end
end


