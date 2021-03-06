require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one_attached(:thumbnail) }
    it { should have_many(:libraries) }
    it { should have_many(:added_books)
      .through(:libraries)
      .source(:user)
    }
  end
end
