class Building < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street, :zip
  validates :name, :presence => true
  has_many :units
  has_many :users, :through => :units
end
