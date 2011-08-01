class Playerdiv < ActiveRecord::Base
  has_many  :matches
  has_many  :players
  belongs_to :division
end
