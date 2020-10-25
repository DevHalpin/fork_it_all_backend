class Favorite < ApplicationRecord
  belongs_to :twist
  belongs_to :user
end
