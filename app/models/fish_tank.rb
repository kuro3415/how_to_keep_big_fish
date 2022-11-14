class FishTank < ApplicationRecord
  validates :name, presence: true

  has_many :fish_tank_article, dependent: :destroy
  has_many :article, through: :fish_tank_article
end
