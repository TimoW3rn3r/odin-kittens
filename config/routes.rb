Rails.application.routes.draw do
  routes :kittens

  root 'kittens#index'
end
