Rails.application.routes.draw do
  post "/auth/login", to: "authentication#login"
  post "/signup", to: "users#create"

  namespace :admin do
    get "/users", to: "admin#users"
    put "/users/:id", to: "admin#update_user"
    delete "/users/:id", to: "admin#delete_user"
  end
end
