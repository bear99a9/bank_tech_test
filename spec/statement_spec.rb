# frozen_string_literal: true

describe Statement do
  let(:statement) { described_class.new }
  let(:transactions) { [transaction_one, transaction_two] }
  let(:transaction_one) { instance_double(Transaction, date: '08/03/2021', credit: 150, debit: 0, balance: 150) }
  let(:transaction_two) { instance_double(Transaction, date: '09/03/2021', credit: 0, debit: 120, balance: 30) }

  describe '#print_statement' do
    it 'Prints a full printed statement' do
      expect do
        statement.print_statement(transactions)
      end.to output("date || credit || debit || balance\n09/03/2021 || 0.00 || 120.00 || 30.00\n08/03/2021 || 150.00 || 0.00 || 150.00\n").to_stdout
    end
  end
end
