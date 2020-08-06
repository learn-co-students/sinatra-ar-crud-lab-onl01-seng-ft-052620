
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # index page
  get '/articles' do
    @articles = Article.all 
    erb :'index'
  end

  # new -- displays a form
  get '/articles/new' do
    @article = Article.new
    erb :'new'
  end

  # create that new article
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end 
 
  # show a certain article
  get '/articles/:id' do
    @article = Article.find(params[:id]) 
    erb :'show'
  end 

  # edit 

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :'edit'
  end

  # update aka patch
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  # delete aka destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
