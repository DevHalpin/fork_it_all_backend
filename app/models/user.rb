class User < ApplicationRecord


  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email)
    user = find_by_email(email)
    user
  end


  has_many :twists, :dependent => :destroy
  has_many :favorites, :dependent => :destroy

  def self.getTwists(id)
    twists = Twist.joins('join recipes on recipes.id = twists.recipe_id').select('*').where(user_id: id)
    return twists
  end
end
