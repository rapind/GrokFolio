class HomeController < ApplicationController
  
  caches_action :index, :expires_in => 24.hours
  
  def index
  end
  
  # If you're not getting a lot of traffic you can setup a cron to hit
  #  /timestamp every minute with a cront which will keep passeger spooled 
  #  up without the need to increase timeouts.
  def timestamp
    render :text => Time.now
  end
  
end