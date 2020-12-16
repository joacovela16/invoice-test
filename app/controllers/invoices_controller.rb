class InvoicesController < ApplicationController
    def index

    end

    def show 
        @invoice = InvoiceHeader.find(params[:id])
        @items =@invoice.invoice_line

        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Invoice No. #{@invoice.id}",
                page_size: 'A4',
                layout: "pdf.html",
                template: "invoices/show.html.slim",
                orientation: "Portrait"
                # lowquality: false,
                # zoom: 1,
                # dpi: 75
            end
        end
    end
end
