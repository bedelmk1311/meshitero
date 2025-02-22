class PostImage < ApplicationRecord
  has_one_attached :image
  #postimageモデルでActiveStorageを使って画像投稿の機能を扱うために記述する

  belongs_to :user
  #  #アソシエーション1:NのN側にbelong_toを記載
end
