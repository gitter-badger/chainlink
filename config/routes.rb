Rails.application.routes.draw do

  root 'application#home'
  get 'identity' => "application#identity"

  resources :assignments, only: [:create, :show, :update] do
    resources :snapshots, only: [:create]
  end
  resources :contracts, only: [:create]
  resources :snapshots, only: [:create, :update]
  post 'api/block_cypher/confirmations/:auth_key' => 'block_cypher#tx_confirmation'

  scope path: '/wei_watchers' do
    post '/events' => 'wei_watchers/events#create'
  end

end
