# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_meteor_books_session',
  :secret      => '4a7cc9e82c545a7f252308355a440221be6baa3e21f91ab8b773202c84fe46e00525fa5431847364326b84f3185784e554fbc8a168ca6f84245c507faa136998'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
