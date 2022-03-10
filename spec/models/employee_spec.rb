require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'Associations' do
    it { should have_many(:posted_questions) }
    it { should have_many(:assigned_questions) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
    it { should belong_to(:department).optional}
  end
end
