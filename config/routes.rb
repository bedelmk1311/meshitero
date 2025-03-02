Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  #deviseのUserモデルを追加した時に自動的に追加される

  #ルーティングを一括して自動生成
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  #親子関係をネストするという

  #get 'users/show'
  #get 'users/edit'
  resources :users, only: [:show, :edit, :update]

  #''と""
  get '/homes/about' => 'homes#about', as: 'about'

end
