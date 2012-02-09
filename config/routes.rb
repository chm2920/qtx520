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
  
  match "/reply" => "posts#reply"
  match "/reply_rst/(:id)" => "posts#reply_rst"
  resources :posts
  
  resources :signs
  
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
    resources :topics
    
    get "posts/index"
    post "posts/index"
    resources :posts
    
    get "sign_categories/index"
    post "sign_categories/index"
    resources :sign_categories
    
    get "signs/index"
    post "signs/index"
    resources :signs
    
    get "fl_categories/index"
    post "fl_categories/index"
    resources :fl_categories
    
    get "fls/index"
    post "fls/index"
    resources :fls
    
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
    get "run_logs/clear"
    resources :run_logs
    
    get "proc_logs/index"
    post "proc_logs/index"
    resources :proc_logs
    
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
