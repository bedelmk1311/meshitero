class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)#ストロングパラメータ
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    #特定のidのPostImageモデルを格納させる
    @post_image = PostImage.find(params[:id])
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
