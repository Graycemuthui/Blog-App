require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
                     posts_counter: 0)

  post = Post.create(author_id: user.id, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)

  like = Like.create(post:, author: user)

  describe 'update like counter' do
    it ' increment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
  end
end
