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

class Behavior < ActiveRecord::Base
  belongs_to :persona
  validates :description, presence: true
end
