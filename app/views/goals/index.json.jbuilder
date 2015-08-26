json.goals do
  json.array!(@goals) do |goal|
    json.extract! goal, :id, :description, :persona_id
    json.url goal_url(goal, format: :json)
  end
end
