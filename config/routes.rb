Rails.application.routes.draw do

  devise_for :users
  get '/' => 'welcome#index'
  get '/events' => 'welcome#events'
  resources :codex, only: [:index, :show]
  get '/feed' => 'codex#feed',
        :as => :feed,
        :defaults => { :format => 'atom' }


  root 'welcome#index'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :codex_guests
  end
end
