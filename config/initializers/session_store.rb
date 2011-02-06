# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bcms_slideshow_session',
  :secret      => 'd013bba7df09d457c2b8a1e9741a1df2671a525d36cdf61511ded245d34c2c7a8459ad8de59b77453c3ab1175517b0a265aba30108235849c3d1683b3b485975'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
