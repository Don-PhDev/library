require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
end
