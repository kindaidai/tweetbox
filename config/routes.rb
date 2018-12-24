Rails.application.routes.draw do
  root to: 'top#index'

  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  delete 'signout' => 'user_sessions#destroy'
end
