class Twist < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :favorites, :dependent => :destroy

  def self.get_random
    Twist.offset(rand(Twist.count)).first
  end
end
