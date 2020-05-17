class Genre < ApplicationRecord
	has_many :products, dependent: :destroy
	enum genre_status: {有効: 0, 無効: 1}
	
end
