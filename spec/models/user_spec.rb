require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
                        posts_counter: 0)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a posts_counter' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid with a posts_counter' do
      subject.posts_counter = 1
      expect(subject).to be_valid
    end
  end
end
