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
#

class Persona < ActiveRecord::Base
  has_many :behaviors
  has_many :goals

  accepts_nested_attributes_for :behaviors, allow_destroy: true
  accepts_nested_attributes_for :goals, allow_destroy: true

  validates :name, presence: true
end
