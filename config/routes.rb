Rails.application.routes.draw do

  # get 'api/docs' => 'api#docs'
  post 'user_token' => 'user_token#create'
  namespace 'api' do
    namespace :v1 do
      resources :articles do
        resources :comments
      end
      root 'home#index'
      get 'auth' => 'home#auth'
      get    '/users'          => 'users#index'
      get    '/users/current'  => 'users#current'
      post   '/users/create'   => 'users#create'
      patch  '/user/:id'       => 'users#update'
      delete '/user/:id'       => 'users#destroy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
