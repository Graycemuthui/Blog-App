require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Tom', photo: '', posts_counter: 0)
    @post = Post.create(
      author: @user,
      title: 'Here we are!',
      text: 'Here they go',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(author: @user, post: @post, text: 'Hello bob')
    Comment.create(author: @user, post: @post, text: 'Hello gram')
    Comment.create(author: @user, post: @post, text: 'Hello sam')
  end

  describe 'GET /index' do
    before(:each) do
      get user_posts_path(@user)
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:each) do
      get user_post_path(@user, @post)
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render correct template' do
      expect(response).to render_template(:show)
    end
  end
end
