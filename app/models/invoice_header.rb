class InvoiceHeader < ApplicationRecord
    has_many :invoice_line, dependent: :destroy
    validates :client_name, presence:true
    def subtotal
        self.invoice_line.map { |item| item.quantity * item.price }.sum
    end

    def discount_calculated
        subtotal * (self.rate / 100.0)
    end

    def totalRutine
        subtotal - discount_calculated 
    end
end
