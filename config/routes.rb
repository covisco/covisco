Rails.application.routes.draw do

  devise_for :users
  # get '/' => 'codex#index'
  get '/events' => 'welcome#events'

  resources :codex, only: [:index, :show]

  get '/feed' => 'codex#feed',
        :as => :feed,
        :defaults => { :format => 'rss' }

  root 'codex#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :codex_guests
  end
end
