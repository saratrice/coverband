class CoverBandName < ActiveRecord::Base
  attr_accessible :name, :band, :up_votes, :down_votes
  validates :name, :presence => true, :uniqueness => {:scope => :band, :message => "has been done."}
  validates :band, :presence => true
  
  belongs_to :user

  acts_as_rateable
end
