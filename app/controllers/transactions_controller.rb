class TransactionsController < ApplicationController
  
  def index
    @transactions = Transaction.all
  end
  
  def new
    @transaction = Transaction.new
  end

  def create
    begin
      parse_transactions
      redirect_to transactions_path
    rescue => exception      
      @transaction = Transaction.new   
      flash.now[:error] = "Arquivo não está de acordo com os parametros .txt"
      render :new
    end 
  end


  private

  def transaction_params
    params.require(:transaction).permit(:cnab_file)  
  end

  def parse_transactions
    File.open(transaction_params[:cnab_file]).each do |line|
      Transaction.create!(
        category: line[0].to_i,
        occurence: "#{line[1..4]}/#{line[5..6]}/#{line[7..8]}".to_date,
        hour: "#{line[42..43]}:#{line[44..45]}:#{line[46..47]}",
        value: line[9..18].to_f / 100.0,
        cpf: line[19..29],
        card_number: line[30..41],
        store_name: line[62..80].strip,
        store_owner: line[48..61].strip        
      )
    end  
  end
end
