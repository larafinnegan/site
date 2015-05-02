class Comment < ActiveRecord::Base
   before_save { author.downcase.capitalize! }

  belongs_to :post
  validates :content, :post, presence: true
  validates :author, presence: true, length: { maximum: 50 }

end
