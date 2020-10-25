class User < ApplicationRecord
  has_many :twists, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
end
