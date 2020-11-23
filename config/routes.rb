Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # routes- only 2 pages
  resources :restaurants, only: [ :index, :show ] do
    # we only want the create action because new
    # will not be seperate page, new will be the show page
    # the form will be on the show page
    resources :reviews, only: :create
  end
end
