class Unit < ActiveRecord::Base
  belongs_to :building
  attr_accessible :rent, :unit_num, :building_id
 	has_one :user
 	has_one :tenant

  validates :unit_num, :presence => true
end
