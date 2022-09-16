class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.post_counter(author_id)
    user = User.find(author_id)
    user.posts_counter += 1
    user.save
  end

  def self.five_recent_comments(author_id, post_id)
    Comment.where(author_id, post_id).order(created_at: :desc).limit(5).all
  end
end
