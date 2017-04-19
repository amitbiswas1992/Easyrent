Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home' 
 get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs
  root to: 'pages#home'
end
