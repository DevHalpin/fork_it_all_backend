class User < ApplicationRecord
  has_secure_password
  has_many :twists, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :favorite_twists, through: :favorites, source: :twists
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :handle, presence: true

  def self.authenticate_with_credentials(email, password)
    stripped = email.strip
    @user = self.where("email = ?",stripped.downcase).first
    if @user && @user.authenticate(password)
      return @user
    end
    nil
  end

  def self.getTwists(id)
    twists = Twist.joins('join recipes on recipes.id = twists.recipe_id').select('*').where(user_id: id)
    return twists
  end
end


  
