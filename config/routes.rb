Bread::Application.routes.draw do
  resources :releases

  get "/shows" => 'facebook#events'
  get "/members" => 'facebook#band_members'
  get "/about" => 'facebook#about_us'

  root to: 'pages#home'
end
