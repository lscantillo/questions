require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Associations' do
    it { should have_many(:questions) }
  end
end
