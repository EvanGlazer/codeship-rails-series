Rails.application.routes.draw do
  namespace :api, path: '' do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
