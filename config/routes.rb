Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      # api test action
      resources :hello, only:[:index,:show]
    end
  end
end
