class User < ActiveRecord::Base

  has_many :posts

  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password

end
