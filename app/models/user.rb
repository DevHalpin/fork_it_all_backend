class User < ApplicationRecord
  has_secure_password
  has_many :twists, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_many :favorite_twists, through: :favorites, source: :twist
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :handle, presence: true, uniqueness: {case_sensitive: false}

  mount_base64_uploader :profile_picture, ImageUploader
  attr_accessor :profile_picture

  def self.authenticate_with_credentials(email, password)
    stripped = email.strip
    @user = self.where("email = ?",stripped.downcase).first
    if @user && @user.authenticate(password)
      return @user
    end
    nil
  end

  def self.getTwists(id, recipe_id)
    
    # attempts to pull a twist from our random user id for the respective recipe
    twists = Recipe.joins(:twists).select('*').where(id: recipe_id, twists: {user_id: id})

    #if this pull is unsuccessful we need to pull all records with recipe id and select a random one that exists 
   if twists.blank?
    puts "No twists were found for user #{id} for recipe id #{recipe_id}"
    twists = Twist.where(recipe_id: recipe_id).order("random()").limit(1)
   end

   def self.getThreeLatest
    twists = Twist.last(3)
    twists
   end

  
    return twists
  end
end


  
