# Be sure to restart your server when you modify this file.
if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: '_forkitall_session'
  #, need to add a domain: "herokuapp"
else
  Rails.application.config.session_store :cookie_store, key: '_forkitall_session'
end