persona = Persona.create(name: "Anye", description: "Ember Padawan")

10.times do
  persona.behaviors.create(description: Faker::Lorem.sentence)
end
