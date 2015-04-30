class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, inverse_of: :post
  has_and_belongs_to_many :tags

  validates :title, :content, :user, presence: true

end
