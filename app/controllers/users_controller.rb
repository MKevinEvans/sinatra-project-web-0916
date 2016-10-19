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
  		erb :'users/show.html'
  	end

    get '/users/:id/edit' do
      @user = User.find(params[:id])
      erb :'users/edit.html'
    end

    patch '/users/:id' do
      @user = User.find(params[:id])
      @user.update(name: params[:name])
      redirect to "/users/#{@user.id}"
    end

    get '/users/:id/delete' do
      @user = User.find(params[:id])
      erb :'users/delete.html'
    end

    delete '/users/:id/delete' do
      @user = User.find(params[:id])
      @user.destroy
      redirect to '/users'
    end



 end



