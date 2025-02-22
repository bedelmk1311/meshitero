class PostImagesController < ApplicationController
  def new
  end

  def create
    @post_image = PostImage.new(post_image_params)#ストロングパラメータ
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end

  def edit
  end

    private
    #require必要とする　データはデータでも許可されたデータか判断する関所
    def post_image_params
      params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
