Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:show] do
    get 'mail', on: :member
  end

  devise_for :users, :admins if defined?(Devise)
end
