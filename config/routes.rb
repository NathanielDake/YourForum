Rails.application.routes.draw do
  #this code creates HTTP GET routes for index and about views. Get requests
  #are used to retrieve information identified by the URL
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  #root method allows the declaration of a default page the app loads when
  #navigating to the home page URL. Root takes a hash as an argument (implied
  # in this case)
  root 'welcome#index'

end
