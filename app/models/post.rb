class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, inverse_of: :post, dependent: :destroy
  has_and_belongs_to_many :tags

  default_scope -> { order(created_at: :desc) }
  validates :title, :content, :user, :user_id, presence: true

end
