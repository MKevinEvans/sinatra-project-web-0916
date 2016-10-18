class UsersController < ApplicationController

	get '/users' do
		@all_users = User.all
	  	erb :'users/index.html'
	  end

  	get '/users/new' do
  		erb :'users/new.html'
  	  end

  	post '/users' do
  		user = User.create(params)
  		redirect to "/users/#{user.id}"
  	end

  	get '/users/:id' do
  		@user = User.find(params[:id])
  		erb :'/users/show.html'
  	end
 end



