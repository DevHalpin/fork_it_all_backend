class Recipe < ApplicationRecord
  has_many :twists, :dependent => :destroy
end
