Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:index, :edit, :show, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
