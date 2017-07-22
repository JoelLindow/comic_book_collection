class Book < ApplicationRecord
  belongs_to :brand
  belongs_to :series

  has_many :users_books, dependent: :destroy
  has_many :users, through: :users_books

  validates_presence_of :title, :issue_number, :description, :img_url

  #Welcome to "Stabby-Lambda"
  scope :ten_recent, -> { order("created_at DESC").take(9) }
end
