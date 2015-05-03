class Comment < ActiveRecord::Base

  belongs_to :post
  validates :content, :post, :post_id, presence: true
  validates :author, presence: true, length: { maximum: 50 }

end
