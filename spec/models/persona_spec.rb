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

require 'rails_helper'

describe Persona do
  
  subject(:persona) { create :persona }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:photo_url) }
  it { should respond_to(:behaviors) }

  it { should be_valid }
  
  it { should validate_presence_of(:name) }
end
