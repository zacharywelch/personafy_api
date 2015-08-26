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

require 'rails_helper'

describe Goal do
  subject(:goal) { create :goal }

  it { should respond_to(:description) }

  it { should be_valid }

  it { should validate_presence_of(:description) }
end
