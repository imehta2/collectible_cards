Rails.application.routes.draw do
  root 'home#index'  # Define the root route first

  get 'about_us', to: 'home#about_us'
  get 'contact_us', to: 'home#contact_us'
  get 'search', to: 'home#search'

  get 'products', to: 'products#index'
end
