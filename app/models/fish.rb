class Fish < ApplicationRecord
  validates :name, presence: true

  has_one :article

  has_many :articles, dependent: :destroy
  has_many :fish_tank, through: :articles
end
