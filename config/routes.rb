Maorigeek::Application.routes.draw do
  devise_for :users
  
  mount GhostTrain::Engine, at: "/ghost"
  root to: 'home#home'
  get 'index' => 'home#home'
  get 'home' => 'home#home', as: 'home'
  get 'about' => 'home#about', as: 'about'
  get 'contact' => 'home#contact', as: 'contact'
  get 'blog' => 'home#home', as: 'blog'
  get 'portfolio' => 'home#portfolio', as: 'portfolio'
end
