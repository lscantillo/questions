require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'Associations' do
    it { should have_many(:employees) }
    it { should have_many(:question) }
  end
end
