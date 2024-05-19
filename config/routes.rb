Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :edit, :update, :show, :new, :create, :destroy]


#  get 'books/:id' => 'books#show', as 'book'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#                    Prefix Verb   URI Pattern                         Controller#Action
#                  root GET    /                                            homes#top
#                 about GET    /homes/about(.:format)                       homes#about
#      new_user_session GET    /users/sign_in(.:format)            devise/sessions#new
#          user_session POST   /users/sign_in(.:format)           devise/sessions#create
#  destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
# new_user_registration GET    /users/sign_up(.:format)      devise/registrations#new
#edit_user_registration GET    /users/edit(.:format)         devise/registrations#edit
#     user_registration PATCH  /users(.:format)              devise/registrations#update
#                       PUT    /users(.:format)              devise/registrations#update
#                       DELETE /users(.:format)              devise/registrations#destroy
#                       POST   /users(.:format)              devise/registrations#create
#                 books GET    /books(.:format)                             books#index
#                       POST   /books(.:format)                             books#create
#              new_book GET    /books/new(.:format)                         books#new
#             edit_book GET    /books/:id/edit(.:format)                    books#edit
#                  book GET    /books/:id(.:format)                         books#show
#                       DELETE /books/:id(.:format)                         books#destroy
#                       PATCH  /books/:id(.:format)                         books#update
#                       PUT    /books/:id(.:format)                         books#update

#                 users GET    /users(.:format)                             users#index
#             edit_user GET    /users/:id/edit(.:format)                    users#edit
#                  user GET    /users/:id(.:format)                         users#show
#                       PATCH  /users/:id(.:format)                         users#update
#                       PUT    /users/:id(.:format)                         users#update