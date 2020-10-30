class Twist < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :favorites, :dependent => :destroy
  has_many :favorited_by, through: :favorites, source: :user
  
  def self.get_random
    Recipe.joins(:twists).joins("join users on twists.user_id = users.id").where(id: 85).select("recipes.meal_image,
    recipes.name,
    recipes.instructions,
    twists.content, twists.id, users.handle"
    ).sample
    Recipe.joins(:twists).where(id: 85).select()
  end
end
