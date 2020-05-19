class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy
  #下のカラム名謎い
  enum cordered_address:{ ご自身の住所: 0, 登録住所から選択: 1, 新しいお届け先: 2}
end
