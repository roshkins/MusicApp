MusicApp::Application.routes.draw do

  only_stuff = [:new, :create]
  resources :bands do
    resources :albums, :only => only_stuff
  end
  resources :albums, :except => only_stuff + [:index] do
    resources :tracks, :only => only_stuff
  end
  resources :tracks, :except => only_stuff + [:index] do
    resources :notes, :only => only_stuff - [:new]
  end
  resources :notes, :only => [:delete]
end
