user = User.create!(
  name: 'Dan Cederholm',
  email: 'dan@gmail.com',
  password: 'password'
)

# Pete "The New Breed"

pete = Persona.create!(
  name: 'Pete',
  role: 'Chief Financial Officer',
  description: "\"In my humble opinion, that's a prophetic statement.\"",
  avatar: 'fizzy',
  color: 'denim',
  user: user
)

pete.behaviors.create!(
  description: "Will do whatever it takes to get ahead"
)
pete.behaviors.create!(
  description: "Puts in long hours at the office"
)
pete.behaviors.create!(
  description: "Values high efficiency"
)

pete.goals.create!(
  description: "Concerned about friends who make more money than him"
)

pete.goals.create!(
  description: "Has clear short and long term financial goals"
)

pete.goals.create!(
  description: "Biggest fear is becoming an irrelevant failure"
)

# Bruce "The Go-Getter"

bruce = Persona.create!(
  name: "Bruce",
  role: 'The Dark Knight',
  description: "\"It's not who I am underneath, but what I do that defines me.\"",
  avatar: 'batman',
  color: 'navy',
  user: user
)

bruce.behaviors.create!(
  description: "Engages in vigilante activities"
)

bruce.behaviors.create!(
  description: "Often uses physical force to subdue those he deems lawbreakers"
)

bruce.behaviors.create!(
  description: "Extremely secretive and generally works alone"
)

bruce.goals.create!(
  description: "Bring order and justice to Gotham City"
)

bruce.goals.create!(
  description: "Turn fear against those who prey on the fearful"
)

bruce.goals.create!(
  description: "Find the absolute best car"
)

seeds = [{ avatar: 'super-why',  
           color: 'blue' },
         { avatar: 'rigby',     
           color: 'purple' },
         { avatar: 'wordgirl',     
           color: 'turquoise' },
         { avatar: 'pokemon',     
           color: 'navy-dark' },
         { avatar: 'gumball',     
           color: 'navy' },
         { avatar: 'cyberchase',
           color: 'red' },
         { avatar: 'fizzy',     
           color: 'teal' },
         { avatar: 'wordgirl',     
           color: 'orange' },
         { avatar: 'ben10',     
           color: 'navy-dark' },
         { avatar: 'fizzy',     
           color: 'purple' }]

seeds.each do |seed|
  persona = Persona.create!(
    name: Faker::Name.first_name,
    role: ['Casual User', 'Business User', 'Power User'].sample,
    description: "\"#{Faker::Hipster.sentence}\"",
    avatar: seed[:avatar],
    color: seed[:color],
    user: user
  )

  3.times do 
    persona.behaviors.create!(
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
    )
  end

  3.times do 
    persona.goals.create!(
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
    )
  end
end
