# == Schema Information
#
# Table name: personas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  avatar      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string
#  role        :string
#

FactoryGirl.define do
  factory :persona do
    name Faker::Name.name
    description Faker::Lorem.sentence
    avatar 'batman'
    color 'denim'
  end
end
