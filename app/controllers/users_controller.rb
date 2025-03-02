class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #URLに記載されたIDを参考に、必要なUserモデルを取得する
    
    @post_images = @user.post_images.page(params[:page])
    #kaminari pageメソッドで使用可能
  end
  
  def edit 
    @user = User.find(params[:id])
    #URLを参考に特定のidを持ったレコードを取得
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    #引数を指定しないとargumentエラー

    redirect_to user_path(current_user.id)
  
  end

  private

  def user_params
    #require必要とする　データはデータでも許可されたデータか判断する関所
    params.require(:user).permit(:name, :profile_image)
  end

end
