Rails.application.routes.draw do
  resources :participants
  root 'pages#home'
end
