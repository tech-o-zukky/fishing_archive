Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  resources :records, only: [ :index, :new, :create, :show, :edit, :update ] do
    resources :comments, only: :create  # add コメント機能追加
  end
end
