class SitemapController < ApplicationController
  
  caches_action :index, :expires_in => 24.hours
  
  def index
    @projects = Project.all(:order => :position)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml
    end
  end
  
end