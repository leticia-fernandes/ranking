Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "deputies#list"

  post "/import", to: 'import_expenses_deputies#import'
  resources :deputies, only: [:list] do
    get '/expenses', action: :list, controller: 'deputy_expenses'
  end

end
