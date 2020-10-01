class AddValueToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :value, :decimal
  end
end
