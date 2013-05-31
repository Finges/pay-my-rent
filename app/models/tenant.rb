class Tenant < User
	belongs_to :unit
	has_one :building, :through => :unit
	has_one :landlord, :through => :building
	has_many :payments
end
