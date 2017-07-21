class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :role

  has_many :users_books
  has_many :books, through: :users_books

  enum role: [:member, :admin]
end
