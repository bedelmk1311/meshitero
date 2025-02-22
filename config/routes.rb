Rails.application.routes.draw do
  devise_for :users
  #deviseのUserモデルを追加した時に自動的に追加される


  root to: "homes#top"
  get 'about' => 'homes#about'
end
