require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Associations' do
    it { should have_many(:questions).through(:questions_tags) }
    it { should have_many(:questions_tags) }
  end
end
