class FishTank < ApplicationRecord
  validates :name, presence: true

  has_many :articles, dependent: :destroy
  has_many :fish, through: :articles
end
