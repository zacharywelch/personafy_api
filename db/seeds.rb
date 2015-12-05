user = User.create!(
  name: 'Dan Cederholm',
  email: 'dan@gmail.com',
  password: 'password'
)

seeds = [{ avatar: 'fizzy',      
           color: 'denim' }, 
         { avatar: 'batman',     
           color: 'navy' },
         { avatar: 'super-why',  
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
    name: 'Pervy Sage',
    description: "\"I don't mean to brag, I don't mean to boast, but I have some hummus for these mini toast!\"",
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
