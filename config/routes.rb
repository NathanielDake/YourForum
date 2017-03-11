Rails.application.routes.draw do


  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]



  #this code creates HTTP GET routes for index and about views. Get requests
  #are used to retrieve information identified by the URL
  get 'about' => 'welcome#about'

  #root method allows the declaration of a default page the app loads when
  #navigating to the home page URL. Root takes a hash as an argument (implied
  # in this case)
  root 'welcome#index'

end
