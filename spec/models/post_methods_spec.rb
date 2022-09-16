require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
                     posts_counter: 0)

  post = Post.create(author_id: user.id, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)

  8.times.collect do
    Comment.create(post:, author: user, text: 'first comment')
  end

  describe 'update comment counter' do
    it 'should return five most recent comments' do
      expect(post.recent_five_comments.length).to eq(5)
    end
  end
end
