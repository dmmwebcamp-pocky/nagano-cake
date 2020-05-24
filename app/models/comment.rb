class Comment < ApplicationRecord
	belongs_to :customer
	validates :comment, presence: true, length: {maximum: 50}
end
