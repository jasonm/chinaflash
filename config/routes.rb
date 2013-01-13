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
  # etc
  match 'sign_out' => 'sessions#destroy', :as => :sign_out
end
