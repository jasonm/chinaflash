SlcSample2::Application.routes.draw do
  # initial from slc-example
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  # role selection and login
  resource :role_selection, only: %w(show)
  root to: "role_selection#show"

  # game creation phase
  resources :games, only: %w(new create)

  # connection phase
  resources :connecting_games, only: %w(show)
  resources :participation_acceptances, only: %w(new create)

  # game phase
  resources :scoreboards, only: %w(show)
  resource :current_matchup, only: %w(show) # keyed by session
  resources :scores, only: %w(create)

  # etc
  match 'sign_out' => 'sessions#destroy', :as => :sign_out
end
