class PostImage < ApplicationRecord
  has_one_attached :image
  #postimageモデルでActiveStorageを使って画像投稿の機能を扱うために記述する

end
