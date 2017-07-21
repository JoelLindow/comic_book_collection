class Book < ApplicationRecord
  belongs_to :brand
  belongs_to :series

  has_many :users_books
  has_many :users, through: :users_books

  validates_presence_of :title, :issue_number, :description, :img_url
end
