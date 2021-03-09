# frozen_string_literal: true

class Statement
  def print_statement(transactions)
    print_header
    print_transactions(transactions)
  end

  private

  def print_header
    print "date || credit || debit || balance\n"
  end

  def print_transactions(transactions)
    transactions.reverse.each do |e|
      print "#{e.date} || #{format(e.credit)} || #{format(e.debit)} || #{format(e.balance)}\n"
    end
  end

  def format(element)
    '%.2f' % element
  end
end
