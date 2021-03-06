class User < ActiveRecord::Base
  belongs_to :unit
  has_one :building, :through => :unit
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  								:phone, :name, :landlord, :unit_id 

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :phone, :name, :landlord, :unit_id, :admin, :as => :admin

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"    
  end
  # attr_accessible :title, :body
end
