class AddCnabToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :cnab_file, :json
  end
end
