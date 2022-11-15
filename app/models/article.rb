class Article < ApplicationRecord
  belongs_to :fish
  
  has_many :fish_tank_article, dependent: :destroy
  has_many :fish_tank, through: :fish_tank_article
end
