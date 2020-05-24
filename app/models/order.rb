class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products, dependent: :destroy
  enum payment_method: {クレジットカード: 0,銀行振込: 1}
  enum order_status: {入金待ち: 0,入金確認: 1,製作中: 2,発送準備中: 3,発送済み: 4}
  validates :ordered_postal_code,presence: true
  validates :ordered_address,presence: true
  validates :address_name,presence: true
  validates :payment_method,presence: true
  def full_ordered
    self.ordered_postal_code + "/" + self.ordered_address + "/" + self.address_name
  end  
end
