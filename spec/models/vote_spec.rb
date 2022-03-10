require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'Associations' do
    it { should belong_to(:question).optional}
    it { should belong_to(:employee).optional}
  end
end
