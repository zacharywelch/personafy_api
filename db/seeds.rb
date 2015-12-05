user = User.first_or_create!(
  name: 'John',
  email: 'john@test.com',
  password: 'admin1234'
)

persona = Persona.first_or_create!(
  name: "Anye",
  description: "Ember Padawan",
  avatar: "batman",
  color: "denim",
  user: user
)

10.times do
  persona.behaviors.first_or_create!(description: Faker::Lorem.sentence)
  persona.goals.first_or_create!(description: Faker::Lorem.sentence)
end
