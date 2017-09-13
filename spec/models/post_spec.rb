require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
  end
  describe 'association' do
    it { should have_many(:comments) }
  end
end
