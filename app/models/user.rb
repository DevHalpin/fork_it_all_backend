class User < ApplicationRecord


  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email)
    user = find_by_email(email)
    user
  end


  has_many :twists, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
end
