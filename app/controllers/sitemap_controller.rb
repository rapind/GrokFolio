class SitemapController < ApplicationController
  
  caches_page :index, :expires_in => 2.days
  
  def index
    @projects = Project.all(:order => :position)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml
    end
  end
  
end