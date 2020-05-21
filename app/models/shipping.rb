class Shipping < ApplicationRecord
    belongs_to :customer
    def full_order_address
        self.postal_code + "/" + self.address + "/" + self.name
    end
end
