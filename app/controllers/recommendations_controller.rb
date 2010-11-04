class RecommendationsController < ApplicationController
  inherit_resources
  actions :index
  
  def index
    index! do
      @meta_title = "Recommendations - #{APP_CONFIG[:name]}"
      @meta_keywords = "Recommendations"
      @meta_description = "Recommendations"
      @intro = "What my clients and managers have to say about my work."
    end
  end
  
  private #-------
    # Defining the collection explicitly for paging and ordering
    def collection
      @recommendations ||= end_of_association_chain.paginate :page => params[:page], :order => 'position'
    end
    
end
