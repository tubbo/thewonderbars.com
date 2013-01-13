Bread::Application.routes.draw do
  get "facebook/about_us"

  get "facebook/contact"

  resources :releases

  get "/shows"    => 'pages#shows'
  get "/members"  => 'facebook#band_members'
  get "/about"    => 'facebook#about_us'
  get "/contact"  => 'facebook#contact'

  root to: 'pages#index'
end
