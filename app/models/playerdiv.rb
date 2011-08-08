class Playerdiv < ActiveRecord::Base
  has_many  :matches
  has_many  :users
  belongs_to :division
end
