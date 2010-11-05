class ProjectsController < ApplicationController
  inherit_resources
  actions :index, :show
  
  #caches_action :index, :cache_path => Proc.new { |c| c.params }, :expires_in => 24.hours
  #caches_action :show, :cache_path => Proc.new { |c| c.params }, :expires_in => 24.hours
  
  def index
    index! do
      @meta_title = "Projects - #{APP_CONFIG[:name]}"
      @meta_keywords = "projects"
      @meta_description = "Projects"
      @intro = "Here you will find a listing of some of the projects I have worked on over the years."
    end
  end
  
  def show
    show! do
      @meta_title = @project.meta_title
      @meta_keywords = @project.meta_keywords
      @meta_description = @project.meta_description
      @intro = @project.intro
    end
  end
  
  private #-------
    # Defining the collection explicitly for paging and ordering
    def collection
      @projects ||= end_of_association_chain.paginate :page => params[:page], :order => 'position'
    end
    
end
