Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  get 'records/index'
end
