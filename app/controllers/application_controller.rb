class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/' do
    # Post.create(:title => 'Hello World', :body => 'This is my first post')
    posts = Post.all.order(created_at: :desc)
    blogs = posts.map do |post|
      {title: post.title,
      body: post.body,
      id: post.id,
      author: post.author,
      created_at: post.created_at,
      updated_at: post.updated_at
    }
    end
    blogs.to_json
  end

  post '/posts' do
    post = Post.create(:title params[:title], :body params[:body])
    post.to_json
    end
  
  post '/authors' do
    author = Author.create(:name => params[:name], :email => params[:email], :password => params[:password])
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(:title params[:title], :body params[:body])
    post.to_json
  end

  delete '/posts/:id' do 
    post = Post.find(params[:id])
    post.destroy
    post.to_json
  end
  
end
