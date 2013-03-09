Bread::Application.routes.draw do
  resources :releases

  get "/shows"    => 'pages#show', id: 'shows'
  get "/members"  => 'facebook/page#band_members'
  get "/about"    => 'facebook#about_us'
  get "/contact"  => 'facebook#contact'

  root to: 'pages#show', id: 'index'
end
