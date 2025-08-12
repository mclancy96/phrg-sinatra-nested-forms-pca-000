Rails.application.routes.draw do
  # Root route that renders a welcome page
  root 'pirates#index'

  # Route to display the new pirate form
  get '/new', to: 'pirates#new'

  # Route to handle form submissions
  post '/pirates', to: 'pirates#create'

  # Route to show pirate details
  get '/pirates/:id', to: 'pirates#show', as: 'pirate'
end
