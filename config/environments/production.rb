# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# See everything in the log (default is :info)
# config.log_level = :debug

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# Enable threaded mode
# config.threadsafe!

# memcache store
config.cache_store = :mem_cache_store, "localhost", { :namespace => 'grokfolio' } # TODO - change this to your app name if you want

config.action_mailer.default_url_options = { :host => 'grokfolio.com' } # TODO - change this to your domain

# These are paths for imagemagick to fix potential paperclip issues. You may not need them.
ENV['PATH'] = "#{ENV['PATH']}:/usr/local/bin"
ENV['LD_LIBRARY_PATH'] = "#{ENV['LD_LIBRARY_PATH']}:/usr/local/lib"

# gmail settings - TODO edit these if your want to send email from the application (I've shown gmail settings here)
config.action_mailer.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => 'youremail@gmail.com',
  :password => 'yourpassword'
}