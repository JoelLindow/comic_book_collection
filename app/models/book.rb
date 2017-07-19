class Book < ApplicationRecord
  belongs_to :brand
  validates_presence_of :title, :issue_number, :description, :img_url
end
