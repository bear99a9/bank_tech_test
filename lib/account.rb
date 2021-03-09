require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    deposit = create_deposit_transaction(amount)
    @transactions << deposit
  end

  def withdraw(amount)
    fail "Insufficent funds" unless can_withdraw?(amount)
    @balance -= amount
  end

  private

  def can_withdraw?(amount)
    @balance - amount >= 0
  end

  def create_deposit_transaction(amount)
    Transaction.new(Time.now.strftime('%d/%m/%Y'), amount, 0, @balance)
  end

end
