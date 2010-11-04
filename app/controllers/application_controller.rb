# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      'admin' # for amin sigin
    else
      'application' # default
    end
  end
  
  before_filter :set_default_meta
  
  def set_default_meta
    @meta_title = APP_CONFIG[:default_meta_title]
    @meta_keywords = APP_CONFIG[:default_meta_keywords]
    @meta_description = APP_CONFIG[:default_meta_description]
    @intro = APP_CONFIG[:default_intro]
  end
  
end
