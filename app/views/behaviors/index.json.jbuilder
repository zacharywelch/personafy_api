json.behaviors do
  json.array!(@behaviors) do |behavior|
    json.extract! behavior, :id, :description, :persona_id
    json.url behavior_url(behavior, format: :json)
  end
end
