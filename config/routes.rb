Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'about_us', to: 'home#about_us'
  get 'contact_us', to: 'home#contact_us'
  get 'search', to: 'home#search'

  # Defines the root path route ("/")
  # root "articles#index"
end
