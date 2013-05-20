class Landlord < User
	has_many :buildings
	has_many :units, :through => :buildings
end