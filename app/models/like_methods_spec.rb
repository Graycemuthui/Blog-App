require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Grayce Muthui', photo: 'http://grayce.com/co/png', bio: 'This is a bio',
                     posts_counter: 0)

  Post.create(author_id: user.id, title: 'Title', text: 'Text', comments_counter: 0, likes_counter: 0)

  like = Like.create(post:, author: user)

describe 'update like counter' do
    it 'should update the like counter' do
      expect(like.update_like_counter(like.post_id)).to eq(1)

 it 'increments the likes_counter by 1' do
      expect { like.update_like_counter(like.post_id) }.to change { like.likes_counter }.by(1)
    end
  end
end
