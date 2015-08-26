json.behavior do
  json.extract! @behavior, :id, :description, :persona_id, :created_at, :updated_at
end
