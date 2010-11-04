class Admin::RecommendationsController < ApplicationController
  inherit_resources
  actions :all, :except => :show
  layout 'admin'
  before_filter :authenticate_administrator!
  after_filter :clear_cache, :only => [:create, :update, :destroy]
  
  def clear_cache
    # TODO - clear the cache
  end
  
  # redirect to collection path
  def create
    create! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end
  
  # redirect to collection path
  def update
    update! do |success, failure|
      success.html { redirect_to collection_path }
    end
  end
  
  # for javascript notifications
  def destroy
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => "Successfuly removed the recommendation."} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the recommendation. Please try again later.'} }
    end
  end
  
  # update the list position
  def update_position
    begin
      recommendation = Recommendation.find(params[:id]) # grab the object
      recommendation.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      logger.error $ERROR_INFO.inspect
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @recommendations ||= end_of_association_chain.find :all, :order => 'position'
    end
    
end