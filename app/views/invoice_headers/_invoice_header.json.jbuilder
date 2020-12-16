json.extract! invoice_header, :client_name, :created_at, :updated_at
json.url invoice_header_url(invoice_header, format: :json)
