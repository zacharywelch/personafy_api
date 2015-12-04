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
#

require 'rails_helper'

describe Persona do

  subject(:persona) { create :persona }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:avatar) }
  it { should respond_to(:behaviors) }
  it { should respond_to(:goals) }

  it { should accept_nested_attributes_for(:behaviors).allow_destroy(true) }
  it { should accept_nested_attributes_for(:goals).allow_destroy(true) }

  it { should be_valid }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:avatar) }
  it { should validate_inclusion_of(:avatar).in_array(%w(batman fizzy ben10 cyberchase 
                                                         adventuretime bloo fusionfall 
                                                         gumball wordgirl rigby pokemon 
                                                         super-why)) }
  it { should validate_presence_of(:color) }
  it { should validate_inclusion_of(:color).in_array(%w(dark blue denim navy turquoise navy-dark
                                                        teal yellow green purple red orange)) }
end
