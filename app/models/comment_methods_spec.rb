require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
                     posts_counter: 0)

  Post.create(author_id: user.id, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)

  comment = Comment.create(post:, author: user)

  describe 'update comment counter' do
    it 'should update the comment counter' do
      expect(comment.update_comment_counter(comment.post_id)).to eq(1)
    end

    it 'increments the comments_counter by 1' do
      expect { comment.update_comment_counter(comment.post_id) }.to change { comment.comments_counter }.by(1)
    end
  end
end
