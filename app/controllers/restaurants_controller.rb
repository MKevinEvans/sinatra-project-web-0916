class RestaurantsController < ApplicationController

  get '/restaurants' do
    
    response = Yelp.client.search('Santa Barbara')
    binding.pry
    response.businesses.each do |restaurant|
    # Restaurant.create(name: restaurant.name, rating: restaurant.rating, address: restaurant.address.first)
    end
      @all_restaurants = Restaurant.all

    erb :'restaurants/index.html'
  end

  get '/restaurants/new' do
    erb :'restaurants/new.html'
  end

  patch '/restaurants/:id/users' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.users << User.find(params[:user_id])
    redirect to "restaurants/#{@restaurant.id}"
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params)
    redirect to "restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/edit.html'
  end

  get '/restaurants/search' do
      erb :'restaurants/search.html'
    end


  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @all_users = User.all
    erb :'restaurants/show.html'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    redirect to "restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/delete.html'
  end

  delete '/restaurants/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect to '/restaurants'
  end




end
