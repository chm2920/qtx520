Qtx520::Application.routes.draw do
  
  match "house" => "topics#node", :id => 1
  match "trade" => "topics#node", :id => 2
  match "life" => "topics#node", :id => 3
  match "business" => "topics#node", :id => 4
  match "friends" => "topics#node", :id => 5
  match "cars" => "topics#node", :id => 6
  match "education" => "topics#node", :id => 7
  match "play" => "topics#node", :id => 8
  
  match "category/(:id)" => "topics#category"
  
  match "info/(:date)_(:id).html" => "topics#show"
  
  match "news/(:date)_(:id).html" => "news_topics#show"
  match "news" => "news_topics#index"
  
  resources :posts
  
  match "publish" => "topics#new"
  match "publish_post" => "topics#create"
  
  match "login" => "user#login"
  match "login_rst" => "user#login_rst"
  match "reg" => "user#reg"
  match "reg_rst" => "user#reg_rst"
  match "logout" => "user#logout"
  
  match "admin" => "account#login"
  get "account/main"
  get "account/desktop"
  match "admin_login_rst" => "account#login_rst"
  match "admin_logout" => "account#logout"
  
  namespace :admin do
    get "topics/index"
    post "topics/index"
    get "topics/null"
    post "topics/null"
    resources :topics
    
    get "posts/index"
    post "posts/index"
    get "posts/all"
    post "posts/all"
    get "posts/import"
    post "posts/import"
    get "posts/get_article"
    get "posts/set_cover"
    get "posts/get_post"
    resources :posts
    
    get "news_categories/index"
    post "news_categories/index"
    resources :news_categories
    
    get "news_topics/index"
    post "news_topics/index"
    resources :news_topics
    
    get "flashpics/index"
    post "flashpics/index"
    resources :flashpics
    
    get "nodes/index"
    post "nodes/index"
    resources :nodes
    
    get "categories/index"
    post "categories/index"
    resources :categories
    
    get "run_logs/index"
    post "run_logs/index"
    resources :run_logs
    
    get "users/index"
    post "users/index"
    resources :users
    
    get "admins/index"
    post "admins/index"
    resources :admins
  end

  get 'kindeditor/images_list'

  post 'kindeditor/upload'

  root :to => "start#index"
  
  match "*path" => "application#render_not_found"
  
end
