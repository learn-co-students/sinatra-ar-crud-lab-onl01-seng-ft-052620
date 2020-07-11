
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  
  end

  get '/articles' do
@articles = Article.all 
    erb :index
  end

  get '/articles/:id' do 

@article = params[:id]

    erb :show
  end

  get '/articles/new' do 

      erb :new
      binding.pry
      
  end

  post '/articles' do 

 @article = Article.create(params)

redirect to "/articles/#{ @article.id }"

  erb :show
end

end
