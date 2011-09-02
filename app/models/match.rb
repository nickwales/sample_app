class Match < ActiveRecord::Base
  has_many :results
  belongs_to :playerdiv
  
  accepts_nested_attributes_for :results
end
