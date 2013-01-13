SlcSample2::Application.routes.draw do
  # initial from slc-example
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  # role selection and login
  resource :role_selection, only: %w(show)
  root to: "role_selection#show"
end
