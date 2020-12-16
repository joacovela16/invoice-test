Rails.application.routes.draw do
  root to: 'invoice_headers#index'
  resources :invoice_lines
  resources :invoice_headers
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
