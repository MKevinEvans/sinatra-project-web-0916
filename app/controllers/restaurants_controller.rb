class RestaurantsController < ApplicationController

  get '/restaurants' do
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

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @all_users = User.all
    erb :'restaurants/show.html'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params)
    redirect to "restaurants/#{@restaurant.id}"
  end
end
