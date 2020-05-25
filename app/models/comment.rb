class Comment < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	validates :comment, presence: true, length: {maximum: 50}
end
