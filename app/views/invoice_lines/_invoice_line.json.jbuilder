json.extract! invoice_line, :id, :created_at, :updated_at
json.url invoice_line_url(invoice_line, format: :json)
