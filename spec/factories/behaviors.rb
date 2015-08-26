# == Schema Information
#
# Table name: behaviors
#
#  id          :integer          not null, primary key
#  description :string
#  persona_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :behavior do
    description Faker::Lorem.sentence
    persona
  end

end
