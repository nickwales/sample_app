class Match < ActiveRecord::Base
  has_many :results
  belongs_to :playerdiv
end
