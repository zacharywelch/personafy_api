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

class Persona < ActiveRecord::Base

  COLORS = %w(dark blue denim navy turquoise navy-dark
              teal yellow green purple red orange)

  has_many :behaviors
  has_many :goals

  accepts_nested_attributes_for :behaviors, allow_destroy: true
  accepts_nested_attributes_for :goals, allow_destroy: true

  validates :name, presence: true
  validates :color, presence: true, inclusion: { in: COLORS }
end
