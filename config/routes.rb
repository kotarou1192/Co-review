Rails.application.routes.draw do
  root 'pages#top'
  get '/post_request', to: 'pages#post_request'
  get '/request_page', to: 'pages#request_page'
  get '/user_page', to: 'pages#user_page'
  get '/search_result', to: 'pages#search_result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
