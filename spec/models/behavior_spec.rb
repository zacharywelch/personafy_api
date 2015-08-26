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

require 'rails_helper'

describe Behavior do
  subject(:behavior) { create :behavior }

  it { should respond_to(:description) }

  it { should be_valid }
  
  it { should validate_presence_of(:description) }
end
