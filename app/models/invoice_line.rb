class InvoiceLine < ApplicationRecord
    belongs_to :invoice_header
    validates :quantity, numericality: {greater_than_or_equal_to: 1}
    validates :price, numericality: {greater_than_or_equal_to: 0}
    validates :product_name, presence: true
end
