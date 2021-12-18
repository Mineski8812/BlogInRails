Rails.application.routes.draw do

  resources :categories
  devise_for :users
  root to: "home#index"
  # get "articles/user/:user_id",to: "articles#from_author"

   resources :articles do
     get "user/:user_id",to: "articles#from_author",on: :collection
   end


   # get "articles/index",to: "articles#index"
   # get "articles/new", to: "articles#new", as: :new_article
   # post "articles", to: "articles#create"
   # get "articles/:id", to: "articles#show"
   # get "articles/:id/edit", to: "articles#edit", as: :edit_article
   # patch "/articles/:id",to: "articles#update", as: :article
   # delete "articles/:id", to: "articles#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
