require 'rails_helper'


RSpec.describe User, type: :model do
  user = User.create(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
  posts_counter: 0)

  4.times.collect do
  Post.create(author_id: user.id, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)
  end

  describe 'recent three posts' do
    it 'should return the three most recent posts' do
      expect(user.three_most_posts(user.id).length).to eq(3)
    end
  end


