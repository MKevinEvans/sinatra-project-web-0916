require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

client = Yelp.client.configure do |config|
  config.consumer_key = 'ZyRtt6IAg0NGozPplwEwcw'
  config.consumer_secret = 'IIHb92ZJtbYs2PkaBIVu_2umTYg'
  config.token = '68JrvZ3HxaK3pCBqGDvoXf98VOg4rl9w'
  config.token_secret = 'nT1QRI8R-_FQ8FiV_f6k0V3kDAo'
end
