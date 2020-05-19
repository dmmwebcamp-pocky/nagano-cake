class Product < ApplicationRecord
	has_many :cart_items,  dependent: :destroy
	has_many :ordered_products, dependent: :destroy
	belongs_to :genre
	attachment :image
	enum sales_status: {販売中: 0, 売切れ: 1}
end
