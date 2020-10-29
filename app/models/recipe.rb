class Recipe < ApplicationRecord
  has_many :twists, :dependent => :destroy
  
  def self.get_random
    Recipe.offset(rand(Recipe.count)).first
  end

  def self.get_three
    Recipe.last(3)
  end
end
