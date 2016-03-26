TechReviewSite::Application.routes.draw do
  devise_for :users
  root 'products#index'
  get 'products/search' => 'products#search'
  resources :products do
    resources :reviews, only: [:new,:create]
  end
  # get 'products/:id/reviews/new' => 'reviews#new'
  # resources :products

end