class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/' do
    posts = Post.all.order(created_at: :desc)
      blogs = posts.map do |post|
      {title: post.title,
      body: post.body,
      likes: post.likes,
      id: post.id,
      author: post.author,
      created_at: post.created_at,
      updated_at: post.updated_at
    }
    end
    blogs.to_json
  end

  patch '/likes/:id' do
    like = Post.find(params[:id])
    like.update(likes: like.likes + 1)
    like.to_json
  end

  get '/authors' do
    authors = Author.all
    authors.to_json
  end

  post '/posts' do
    post = Post.create(title: params[:title], body: params[:body], likes: 0)
    post.to_json
    end
  
  post '/authors' do
    author = Author.create(name: params[:name], email: params[:email])
    author.to_json
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(title: params[:title], body: params[:body])
    post.to_json
  end

  delete '/posts/:id' do 
    post = Post.find(params[:id])
    post.destroy
    post.to_json
  end
  
end

