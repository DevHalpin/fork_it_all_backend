class Twist < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  has_many :favorites, :dependent => :destroy
end
