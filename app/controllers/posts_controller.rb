class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  # a method to create a new form for a post
  def new
    @post = Post.new
  end

  # add a route to handle the HTTP POST requests that result from submissions of the form and implement the create controller
  def create
    @post = current_user.posts.new(post_params)
    # respond to block
    respond_to do |format|
      format.html do
        # if save is successful
        if @post.save
          # redirect to index
          redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
        else

          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
