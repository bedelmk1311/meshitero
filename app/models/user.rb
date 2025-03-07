class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  #profile_imageという名前でActiveStorageでプロフィール画像を保存

  has_many :post_images, dependent: :destroy
  #投稿そのもの

  has_many :post_comments, dependent: :destroy
  #Userのデータが削除されたとき、そのUserが投稿したコメントも一緒に削除

  has_many :favorites, dependent: :destroy
  #Userのデータが削除されたとき、そのUserが投稿したfavoriteも一緒に削除

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  #このメソッドを実行する際に100x100の画像にリサイズが行われる
  #画像サイズの変更にImageMagick というライブラリが必要なので要インストール
end
