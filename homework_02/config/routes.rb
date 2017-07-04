Rails.application.routes.draw do
  get 'authors/index'

  get 'authors/new'

  get 'authors/create'

  get 'authors/show'

  get 'authors/edit'

  get 'authors/update'

  get 'authors/destroy'

  root 'books#index'
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
