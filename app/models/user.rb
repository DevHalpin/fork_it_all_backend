class User < ApplicationRecord
 
  has_many :twists, :dependent => :destroy
  has_many :favorites, :dependent => :destroy

  def self.getTwists(id)
    twists = Twist.joins('join recipes on recipes.id = twists.recipe_id').select('*').where(user_id: id)
    return twists
  end
end
