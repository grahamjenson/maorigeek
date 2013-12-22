Maorigeek::Application.routes.draw do
  devise_for :users
  
  mount GhostTrain::Engine, at: "/ghost"
  root to: 'home#home'
  get 'index' => 'home#home'
  get 'home' => 'home#home', as: 'home'
  get 'about' => 'home#about', as: 'about'
  get 'contact' => 'home#contact', as: 'contact'
  post 'contact' => 'home#contact_form_submit', as: 'contact_form'
  get 'blog' => 'home#blog', as: 'blog'
  get 'post/:id' => 'home#post', as: 'post'
  get 'portfolio' => 'home#portfolio', as: 'portfolio'
end
