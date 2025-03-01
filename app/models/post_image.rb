class PostImage < ApplicationRecord
  has_one_attached :image 
  #attach 付ける
  #postimageモデルでActiveStorageを使って画像投稿の機能を扱うために記述する

  belongs_to :user
  #  #アソシエーション1:NのN側にbelong_toを記載
  has_many :post_comments, dependent: :destroy
  #投稿そのもののデータが削除されたとき、コメントも一緒に削除

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  # get_imageメソッド
  # unless もし〜でない限りは
end
