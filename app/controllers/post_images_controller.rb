class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)#ストロングパラメータ
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end

  end

  def index
    #@post_images = PostImage.all
    #postimagesテーブル内の全データが取得
    @post_images = PostImage.page(params[:page])
    #1ページ分の決められた数のデータだけを、新しい順に取得
  end

  def show
    #特定のidのPostImageモデルを格納させる
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    #コメントを投稿するためのインスタンス変数を定義する（空箱を用意する）
  end

  def edit
  end

  def destroy
    #削除するPostImageレコードを取得
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end


  private
    #require必要とする　データはデータでも許可されたデータか判断する関所
    def post_image_params
      params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
