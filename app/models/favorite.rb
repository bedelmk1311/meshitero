class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :user_id, uniqueness: {scope: :post_image_id}
  #バリデーション設定(同じ投稿にいいねを複数回押せないように制限)
  #uniqueness 一意性、唯一性 すでにテーブルに保存されている値と重複していないかをチェック
  #uniquenessとscopeはセットで覚える {〜}が複数存在しないようにする
end
