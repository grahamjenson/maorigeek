Maorigeek::Application.routes.draw do
  devise_for :users
  
  mount GhostTrain::Engine, at: "/ghost"

end
