class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set(:views, 'app/views')

  get '/' do
  	redirect to '/users'
  end

end

