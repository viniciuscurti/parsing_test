class Transaction < ApplicationRecord

  def credit?
    ['1' , '4' , '5' , '6' , '7' , '8'].include? category
  end

  def self.sum_transactions(transactions)
    transactions.reduce(0) { |acc, transaction| transaction.credit? ? acc += transaction.value : acc -= transaction.value }
  end
end
