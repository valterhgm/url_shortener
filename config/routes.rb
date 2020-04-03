Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "shortener#new", as: "root"
  post "/", to: "shortener#create"
  get "/:shortener", to: "shortener#redirect_shortner"

  get "/shortener/:id", to: "shortener#show", as: "shortener"
end
