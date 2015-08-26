json.personas do
  json.array!(@personas) do |persona|
    json.extract! persona, :id, :name, :description, :photo_url
    json.url persona_url(persona, format: :json)
  end
end
