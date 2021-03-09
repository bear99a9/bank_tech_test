# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

class Account
  DEFAULT_BALANCE = 0
  attr_reader :balance, :transactions

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    deposit = create_deposit_transaction(amount)
    @transactions << deposit
  end

  def withdraw(amount)
    raise "Insufficent funds current balance: £#{@balance}" unless can_withdraw?(amount)

    @balance -= amount
    withdraw = create_withdraw_transaction(amount)
    @transactions << withdraw
  end

  def print_statement
    Statement.new.print_statement(@transactions)
  end

  private

  def can_withdraw?(amount)
    @balance - amount >= 0
  end

  def create_deposit_transaction(amount)
    Transaction.new(Time.now.strftime('%d/%m/%Y'), amount, 0, @balance)
  end

  def create_withdraw_transaction(amount)
    Transaction.new(Time.now.strftime('%d/%m/%Y'), 0, amount, @balance)
  end
end
