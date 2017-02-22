Rails.application.routes.draw do




  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end




  #this code creates HTTP GET routes for index and about views. Get requests
  #are used to retrieve information identified by the URL
  get 'about' => 'welcome#about'

  #root method allows the declaration of a default page the app loads when
  #navigating to the home page URL. Root takes a hash as an argument (implied
  # in this case)
  root 'welcome#index'

end
