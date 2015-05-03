class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, inverse_of: :post, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  default_scope -> { order(created_at: :desc) }
  validates :title, :content, :user, :user_id, presence: true

  def tag_list
  tags.namejoin(", ")
end

end
