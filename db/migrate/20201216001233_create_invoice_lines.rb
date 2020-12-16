class CreateInvoiceLines < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_lines do |t|

      t.date :creation_date
      t.date :modification_date
      t.string :product_name, null: false
      t.float :quantity, default: 0
      t.float :price, null:false, default: 0
      t.float :total, default: 0
      t.text :description, default: ""
      t.references :invoice_header, foreign_key: true
    end
  end
end
