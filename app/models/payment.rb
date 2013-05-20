class Payment < ActiveRecord::Base
  belongs_to :user
  has_one :tenant, :through => :user
  attr_accessible :amount, :amount_due
end
