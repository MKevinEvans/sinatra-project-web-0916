class Restaurant < ActiveRecord::Base
	has_many :user_restaurants
	has_many :users, through: :user_restaurants

	def self.find_or_create(business)
		result = Restaurant.all.find{|restaurant| restaurant.yelp_id == business.id}
		result || Restaurant.create(yelp_id: business.id, name: business.name, rating: business.rating, address: business.location.display_address.join(', '))
	end
end
