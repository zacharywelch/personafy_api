persona = Persona.create(name: "Anye", description: "Ember Padawan", color: "denim")

10.times do
  persona.behaviors.create(description: Faker::Lorem.sentence)
  persona.goals.create(description: Faker::Lorem.sentence)
end
