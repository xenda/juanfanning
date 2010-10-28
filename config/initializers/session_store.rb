# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_juanfanning_session',
  :secret      => 'b7064cfc2f62d0312145083be084d6f4dd15fd7bd900212842d6119a3c1e4ed2db4796987daa31d0e8b5d18f7ee58ad01d2c872a40dabad908dd57e171f1abb0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
