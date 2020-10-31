class Twist < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :favorites, :dependent => :destroy
  has_many :favorited_by, through: :favorites, source: :user
  
  def self.getTwist
    Recipe.joins(:twists).select("recipes.id, recipes.meal_image,
    recipes.name, twists.content"
    ).sample
  end
end
