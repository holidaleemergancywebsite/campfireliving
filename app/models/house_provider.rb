class HouseProvider < ActiveRecord::Base
  validates :first_name, presence: true, length: {minimum: 3}
  validates :phone_number, presence: true, length: {minimum: 7}
  validates :city, :state, presence: true
  
end