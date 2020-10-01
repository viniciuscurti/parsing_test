class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :category
      t.date :occurence
      t.string :hour
      t.string :cpf
      t.string :card_number
      t.string :store_name
      t.string :store_owner

      t.timestamps
    end
  end
end
