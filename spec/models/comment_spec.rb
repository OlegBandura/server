require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :comment }
  end

  describe 'assotiations' do
    it { should belong_to :article }
  end
end
