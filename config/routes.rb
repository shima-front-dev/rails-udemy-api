Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    # mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      # api test action
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/registration',
        sessions: "devise_token_auth/sessions"
      }
      resources :hello, only:[:index,:show]
      resources :users
    end
  end
end
