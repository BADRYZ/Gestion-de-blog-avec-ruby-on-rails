Rails.application.routes.draw do
 # get 'sessions/new'
 get 'login'=>'sessions#new'
 post 'login'=> 'sessions#create'
 get 'logout'=> 'sessions#destroy'




  #get 'utilisateurs/new'
  #get 'pages/home'
  #get 'pages/aide'
  #get 'pages/contact'    #ajouter


  root 'pages#home'
  get 'aide' => 'pages#aide'
  get 'contact' => 'pages#contact'


  get 'inscription' => 'utilisateurs#new'
  resources :utilisateurs

  resources :articles,only: [:create,:destroy]
  #resources :

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


# aide_path => '/aide'
# aide_url => 'http://localhost:3000/aide'
