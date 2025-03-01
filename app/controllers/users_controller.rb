class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #URLに記載されたIDを参考に、必要なUserモデルを取得する
    @post_images = @user.post_images
    #@userの投稿全て(post_images)を取得する
  end

  def edit
  end
end
