Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :chats, only: %i[show create], param: :title
  resources :messages, only: :create
  root "chats#index"

  namespace :api do
    namespace :v1 do
      resources :chats, only: [:index] do
        resources :messages, only: [:create]
      end
    end
  end
end
