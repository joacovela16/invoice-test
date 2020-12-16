class CreateInvoiceHeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_headers do |t|

      t.string :client_name, null: false
      t.string :client_last_name, null: false
      t.string :doc_id, null: false
      
      t.date :creation_date
      t.date :modification_date
      
      t.string :phone
      t.string :email
      t.string :address

      t.float :rate
      t.float :total, default: 0
    end
  end
end
