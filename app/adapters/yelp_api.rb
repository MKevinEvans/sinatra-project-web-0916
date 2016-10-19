class YelpApi

  def self.client
    @client ||= Yelp::Client.new({ consumer_key: 'ZyRtt6IAg0NGozPplwEwcw',
      consumer_secret: 'IIHb92ZJtbYs2PkaBIVu_2umTYg',
      token: '68JrvZ3HxaK3pCBqGDvoXf98VOg4rl9w',
      token_secret: 'nT1QRI8R-_FQ8FiV_f6k0V3kDAo'
  })
  end

  def self.search(location, term)
    @response = client.search(location, {term: term})
    @response.businesses.map do |business|
      Restaurant.find_or_create(business)
    end
  end


end
