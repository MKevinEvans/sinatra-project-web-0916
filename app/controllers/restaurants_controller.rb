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

  get '/restaurants/search/:location/:term' do
    @results = YelpApi.search(params[:location].gsub("+"," "), params[:term].gsub("+"," "))
    @all_users = User.all
      erb :'restaurants/results.html'
    end

  get '/restaurants/search' do
      erb :'restaurants/search.html'
    end

  post '/restaurants/search' do
    @results = YelpApi.search(params[:location], params[:term])
    redirect to "restaurants/search/#{params[:location].gsub(" ","+")}/#{params[:term].gsub(" ","+")}"
  end

  patch '/restaurants/results' do
    # binding.pry
    @user = User.find(params[:user_id])
    @results = params[:restaurants]
    @results.each do |restaurant_id|
      @user.restaurants << Restaurant.find(restaurant_id)
    end
    @user.save
    redirect to "users/#{@user.id}"
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
