class Product < ApplicationRecord
  # :name, string
  validates :name, presence: true
  validates :name, uniqueness: true
end
