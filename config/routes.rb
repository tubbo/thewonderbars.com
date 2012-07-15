Bread::Application.routes.draw do
  resources :releases

  get "/shows"    => 'pages#shows'
  get "/members"  => 'facebook/page#band_members'
  get "/about"    => 'facebook/page#about_us'
  get "/contact"  => 'facebook/page#contact'

  root to: 'pages#index'
end
