class User < ApplicationRecord
  has_many :games, dependent: :destroy
  validates :username, :uniqueness => {:case_sensitive => false}
  has_secure_password
end
