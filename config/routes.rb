ActionController::Routing::Routes.draw do |map|
  
  # public area
  map.root :controller => 'home', :action => 'index'
  map.resources :sitemap
  map.resources :projects
  map.resources :recommendations
  
  map.devise_for :administrators
  
  # administration area
  map.admin '/admin', :controller => 'admin/projects'
  map.namespace :admin do |admin|
    admin.resources :projects, :member => { :update_position => :put }
    admin.resources :recommendations, :member => { :update_position => :put }
  end
  
end
