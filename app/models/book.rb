class Book < ApplicationRecord
  has_many :recipes

  validates :title, presence: true
  validates :author, presence: true
end
