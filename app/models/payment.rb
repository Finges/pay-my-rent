class Payment < ActiveRecord::Base
  belongs_to :tenant
  attr_accessible :amount, :amount_due
end
