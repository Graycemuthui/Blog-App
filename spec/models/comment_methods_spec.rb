require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
                     posts_counter: 0)

  post = Post.create(author_id: user.id, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)

  Comment.create(post:, author: user, text: 'first comment')

  describe 'update comment counter' do
    it ' increment comments_counter' do
      expect(Post.find(post.id).comments_counter).eql?(post.comments_counter + 1)
    end
  end
end
