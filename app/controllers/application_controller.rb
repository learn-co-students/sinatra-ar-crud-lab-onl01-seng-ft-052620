
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # Create the get '/articles' controller action. This action should use Active Record to grab all of the articles and store them in an instance variable, @articles. Then, it should render the index.erb view. That view should use ERB to iterate over @articles and render them on the page.
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # First, create a route in your controller: get '/articles/new', that renders the new.erb view. This view will be a blank form that should submit a POST request to /articles. (Look up the method and action attributes for HTML forms if you aren't sure how to do this).
  get '/articles/new' do
    erb :new
  end

  # Now you will need to tell your controller what to do when your form sends that POST request, so create a route on your controller post '/articles' that creates a new article from the params from the form, then redirects to that new article's show page.
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  #Create the get '/articles/:id' controller action. This action should use Active Record to grab the article with the id that is in the params and set it equal to @article. Then, it should render the show.erb view page. That view should use ERB to render the @article's title and content.
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.delete
    redirect to '/articles'
  end
end
