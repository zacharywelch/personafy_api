# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  description :string
#  persona_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    description Faker::Lorem.sentence
    persona
  end

end
