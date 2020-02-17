Rails.application.routes.draw do
  
  devise_for :users
  root 'notes#index' , as: 'home'

  get 'about' => 'description#about', as: 'about'
  
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
