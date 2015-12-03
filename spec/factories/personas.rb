# == Schema Information
#
# Table name: personas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  photo_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string
#

FactoryGirl.define do
  factory :persona do
    name Faker::Name.name
    description Faker::Lorem.sentence
    photo_url Faker::Avatar.image
    color 'denim'
  end
end
