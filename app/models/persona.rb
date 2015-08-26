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
  validates :name, presence: true
end
