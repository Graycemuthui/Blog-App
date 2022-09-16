require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(author_id: 1, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    # test if title is blank and has characters not exceeding 250
    it 'should not be valid with a title exceeding 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'should be valid if comments_counter is 0' do
      subject.comments_counter = 0
      expect(subject).to be_valid
    end

    it 'should be valid if likes_counter is 0' do
      subject.likes_counter = 0
      expect(subject).to be_valid
    end
  end
end
