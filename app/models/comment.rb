class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author, presence: true
  validates :content, presence: true
  validates :post, presence: true
end
