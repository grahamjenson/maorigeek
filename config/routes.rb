Maorigeek::Application.routes.draw do
  resources :gists

  devise_for :users
  
  mount GhostTrain::Engine, at: "/ghost"
  get '/admin', to: redirect('/ghost')
  
  get 'users/:id' => 'users#profile', :as => :user_profile

  root to: 'home#home'
  get 'index' => 'home#home'
  get 'home' => 'home#home', as: 'home'
  get 'about' => 'home#about', as: 'about'
  get 'contact' => 'home#contact', as: 'contact'
  post 'contact' => 'home#contact_form_submit', as: 'contact_form'
  get 'blog' => 'home#blog', as: 'blog'
  get 'post/:slug' => 'home#post', as: 'post'
  get 'portfolio' => 'home#portfolio', as: 'portfolio'
  get 'portfolio/:id' => 'home#portfolio_item', as: 'portfolio_item'

  get 'sitemap.xml', :to => 'home#sitemap', :defaults => { :format => 'xml' }

  get 'authenticate/:token', :to => 'people#authenticate_email', as: 'authenticate_email'

  resources :people, :only => :create
end
