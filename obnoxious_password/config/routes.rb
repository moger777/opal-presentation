Rails.application.routes.draw do
  root 'welcome#index'

  get 'signup' => 'users#new', as: 'signup'
  post 'signup' => 'users#create'
  get 'success' => 'users#success', as: 'success'
end
