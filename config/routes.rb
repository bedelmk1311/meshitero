Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  #deviseのUserモデルを追加した時に自動的に追加される

  #ルーティングを一括して自動生成
  resources :post_images

  #''と""
  get "/homes/about" => "homes#about", as: "about"

end
