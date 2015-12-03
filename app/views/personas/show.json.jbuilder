json.persona do
  json.extract! @persona, :id, :name, :description, :photo_url, :color, :created_at, :updated_at

  json.behaviors_attributes @persona.behaviors do |behavior|
    json.extract! behavior, :id, :description
  end

  json.goals_attributes @persona.goals do |goal|
    json.extract! goal, :id, :description
  end
end


