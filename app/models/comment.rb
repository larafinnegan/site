class Comment < ActiveRecord::Base
   before_save :cap_name

  belongs_to :post
  validates :author, :content, :post, presence: true


  private

  def cap_name
    self.author = author.downcase.capitalize
  end
end
