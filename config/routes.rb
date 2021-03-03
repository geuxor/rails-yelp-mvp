Rails.application.routes.draw do
  # resources :restaurants do
  #   resources :reviews, only: [ :new, :create ]
  # end
  
  # get root/restaurants

  # A visitor can see the list of all restaurants.
  get "restaurants", to: "restaurants#index"
  
  # A visitor can add a new restaurant, redirected to show view
  get "restaurants/new", to: "restaurants#new", as: :new_restaurant
  post "restaurants", to: "restaurants#create"

  #see the details of restaurant, with all the reviews related to it
  get "restaurants/:id", to: "restaurants#show", as: :restaurant

  # update restaurant
  get "restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  patch "restaurants/:id", to: "restaurants#update"
  
  # As a user I can delete a restaurant
  delete "restaurants/:id", to: "restaurants#destroy"
  
  # A visitor can add new review to a restaurant
  # restaurants/38/reviews/new
  get "restaurants/:restaurant_id/reviews/new", to: "reviews#new", as: :new_review
  post "restaurants/:restaurant_id/reviews", to: "reviews#create"
  get "restaurants/:restaurant_id/reviews", to: "reviews#index", as: :reviews
end