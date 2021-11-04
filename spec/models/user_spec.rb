require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:books).dependent(:destroy) }
    it { should have_many(:libraries) }
    it { should have_many(:library_additions)
      .through(:libraries)
      .source(:book)
    }
  end
end
