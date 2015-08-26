json.goal do
  json.extract! @goal, :id, :description, :persona_id, :created_at, :updated_at
end
