class Recommendation < ActiveRecord::Base
  acts_as_list
  
  validates_presence_of :name, :title, :company, :body
  validates_uniqueness_of :name
  validates_length_of :name, :within => 3..64
  validates_length_of :title, :within => 3..128
  validates_length_of :company, :within => 3..128
  validates_length_of :body, :within => 3..2000
  
  # for pagination
  def self.per_page
    4
  end
  
  # grab a rendom recommendations. Note rand() is a MySQL function.
  def self.random
    self.find(:first, :order => 'rand()')
  end
  
end
