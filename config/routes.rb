Rails.application.routes.draw do
  devise_for :users
  get '/' => 'welcome#index'
  get '/events' => 'welcome#events'

  root 'welcome#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :codex_guests
  end
end
