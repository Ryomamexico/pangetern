Rails.application.routes.draw do
  resources :users
  get 'en', to: 'en#index'
  get 'news', to: 'news#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "ja#index"
  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  post 'contacts/thanks' => 'contacts#thanks'
end
