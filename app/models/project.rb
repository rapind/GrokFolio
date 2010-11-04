class Project < ActiveRecord::Base
  acts_as_list
  
  validates_presence_of :title, :intro, :description
  validates_uniqueness_of :title
  validates_length_of :title, :within => 3..128
  validates_length_of :intro, :within => 3..200
  validates_uniqueness_of :url, :allow_blank => true
  validates_length_of :url, :within => 12..255, :allow_blank => true
  
  named_scope :recent, :limit => 3, :order => :position
  
  has_attached_file :image,
                    :styles => { :normal => "300x225#", :small => "150x112#", :thumb => "100x75#" },
                    :default => :normal,
                    :path => ":rails_root/public/system/projects/:id.:extension",
                    :url => "/system/projects/:id.:extension"
  
  # title is our slug / permalink
  has_friendly_id :title, :use_slug => true
  
  # if meta title hasn't been provided, just return the title
  def meta_title
    read_attribute(:meta_title).blank? ? self.title : read_attribute(:meta_title)
  end
  
  # if meta keywords hasn't been provided, just return title
  def meta_keywords
    read_attribute(:meta_keywords).blank? ? self.title : read_attribute(:meta_keywords)
  end
  
  # if meta description hasn't been provided, just return the first 255 characters of intro
  def meta_description
    read_attribute(:meta_description).blank? ? self.intro[0, 255] : read_attribute(:meta_description)
  end
  
  # for pagination
  def self.per_page
    3
  end
  
end
