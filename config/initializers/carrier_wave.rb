require 'carrierwave/orm/activerecord'

# config/initializers/carrierwave.rb
CarrierWave.configure do |config|
  config.storage = :file
  config.asset_host = ActionController::Base.asset_host
end