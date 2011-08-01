class Division < ActiveRecord::Base
  belongs_to :season
  has_many :playerdiv
end
