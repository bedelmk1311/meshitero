Rails.application.routes.draw do
  #get 'postimages/new'
  #get 'postimages/index'
  #get 'postimages/show'
  #get 'postimages/edit'
  #ルーティングを一括して自動生成
  resources :post_images

  devise_for :users
  #deviseのUserモデルを追加した時に自動的に追加される


  root to: "homes#top"
  #''と””の違い　
  get "/homes/about" => "homes#about", as: "about"

end
