class Unit < ActiveRecord::Base
  belongs_to :building
  attr_accessible :rent, :unit_num, :building_id

  validates :unit_num, :presence => true
end
